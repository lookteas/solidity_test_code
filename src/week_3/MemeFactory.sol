// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "./MemeToken.sol"; // 引入上面的实现合约

contract MemeFactory {
    using Clones for address;

    address public immutable implementation;

    // 记录每个用户部署的铭文（可选）
    mapping(address => address[]) public userInscriptions;

    // 事件
    event InscriptionDeployed(address indexed owner, address token, string symbol, uint256 totalSupply, uint256 perMint);

    constructor(address _implementation) {
        require(_implementation != address(0), "Invalid implementation");
        implementation = _implementation;
    }

    function deployInscription(
        string memory symbol,
        uint256 totalSupply,
        uint256 perMint
    ) external returns (address tokenAddr) {
        require(bytes(symbol).length > 0, "Invalid symbol");
        require(totalSupply > 0, "Total supply must be > 0");
        require(perMint > 0 && perMint <= totalSupply, "Invalid perMint");

        // 使用最小代理克隆
        tokenAddr = implementation.clone();

        // 初始化代理合约
        MemeToken(tokenAddr).initialize(
            string(abi.encodePacked("Meme ", symbol)),
            symbol,
            totalSupply,
            perMint
        );

        // 设置调用者为 owner（mint 权限）
        // 注意：initialize 已经调用 Ownable 的 init，owner 是 msg.sender

        userInscriptions[msg.sender].push(tokenAddr);

        emit InscriptionDeployed(msg.sender, tokenAddr, symbol, totalSupply, perMint);
    }

    function mintInscription(address tokenAddr) external {
        MemeToken token = MemeToken(tokenAddr);
        // 检查调用者是否是 owner（即部署者）
        require(token.owner() == msg.sender, "Only owner can mint");

        uint256 amount = token.perMintLimit();
        token.mint(msg.sender, amount);
    }

    // 可选：查询用户部署的铭文
    function getInscriptions(address user) external view returns (address[] memory) {
        return userInscriptions[user];
    }
}