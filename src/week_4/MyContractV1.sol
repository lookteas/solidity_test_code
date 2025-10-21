// SPDX-License-Identifier: MIT
// contracts/MyContractV1.sol
pragma solidity ^0.8.25;

import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract MyContractV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 public x;
    address public owner;

    // 预留 50 个槽供未来升级使用
    uint256[50] private __gap;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(uint256 _x) public initializer {
        __Ownable_init();
        x = _x;
        owner = msg.sender;
    }

    function setX(uint256 _x) public {
        x = _x;
    }

    // UUPS 必须实现
    function _authorizeUpgrade(address) internal override onlyOwner {}
}