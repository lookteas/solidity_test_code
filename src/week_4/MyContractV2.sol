// SPDX-License-Identifier: MIT
// contracts/MyContractV2.sol
pragma solidity ^0.8.25;

import "./MyContractV1.sol";

contract MyContractV2 is MyContractV1 {
    // 新增变量：必须“占用”原 __gap 的位置（即加在末尾）
    string public name;

    // 更新后的 __gap：原来 50 个，现在用了 1 个（string 指针占 1 槽），剩 49
    uint256[49] private __gap;

    // 注意：不需要新 initializer，除非要初始化 name
    // 如果需要，可写一个 upgradeToV2 函数

    function setName(string calldata _name) public {
        name = _name;
    }
}