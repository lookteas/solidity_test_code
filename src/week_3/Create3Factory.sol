// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Create3} from "./create3.sol";

contract Create3Factory {
    event Deployed(address indexed addr, bytes32 indexed salt);
    
    // 存储已部署的地址
    mapping(bytes32 => address) private deployedAddresses;
    
    function deploy(bytes32 salt, bytes memory creationCode) external payable returns (address) {
        // 检查是否已经部署过
        if (deployedAddresses[salt] != address(0)) {
            return deployedAddresses[salt];
        }
        
        // 部署新合约
        address addr = Create3.deploy(salt, creationCode, msg.value);
        
        // 存储部署的地址
        deployedAddresses[salt] = addr;
        
        emit Deployed(addr, salt);
        return addr;
    }
    
    function getAddress(bytes32 salt) external view returns (address) {
        return deployedAddresses[salt];
    }
}
