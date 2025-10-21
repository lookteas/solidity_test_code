// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract MemeToken is Initializable, ERC20, Ownable {
    uint256 public totalSupplyCap;
    uint256 public perMintLimit;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(
        string memory name,
        string memory symbol,
        uint256 _totalSupplyCap,
        uint256 _perMintLimit
    ) public initializer {
        __ERC20_init(name, symbol);
        __Ownable_init();

        require(_totalSupplyCap > 0, "Total supply must be > 0");
        require(_perMintLimit > 0 && _perMintLimit <= _totalSupplyCap, "Invalid perMint");

        totalSupplyCap = _totalSupplyCap;
        perMintLimit = _perMintLimit;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        require(amount <= perMintLimit, "Exceeds per-mint limit");
        require(totalSupply() + amount <= totalSupplyCap, "Exceeds total supply cap");
        _mint(to, amount);
    }
}