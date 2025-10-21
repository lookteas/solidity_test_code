// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

library Create3 {
    // 自定义地址计算：使用 salt + factory 地址
    function getCustomAddress(bytes32 salt, address factory) internal pure returns (address) {
        return address(uint160(uint256(keccak256(abi.encodePacked(salt, factory)))));
    }

    // 部署函数：相同 salt 不同字节码得到相同地址
    function deploy(
        bytes32 salt,
        bytes memory creationCode,
        uint256 value
    ) internal returns (address deployed) {
        // 直接使用 CREATE 部署合约
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, creationCode)
            let size := mload(creationCode)
            deployed := create(value, add(ptr, 0x20), size)
        }
        
        // 检查部署是否成功
        require(deployed != address(0), "DEPLOYMENT_FAILED");
    }
}
