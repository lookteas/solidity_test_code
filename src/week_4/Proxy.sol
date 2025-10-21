// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 目标合约（提供逻辑）
contract Logic {
    uint256 public value1;
    uint256 public value2;
    string public name;

    function approve(uint256 v) public {
        value1 = v;
    }

    function deposit(uint256 v) public {
        value2 = v;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    // 👇 批量操作函数：一次调用完成多个设置
    function batchSet(
        uint256 v1,
        uint256 v2,
        string memory _name
    ) public {
        approve(v1);
        deposit(v2);
        setName(_name);
    }
}

// 代理/调用者合约
contract Proxy {
    // 存储必须与 Logic 合约布局兼容
    uint256 public value1;
    uint256 public value2;
    string public name;

    function delegateBatchSet(
        address logic,
        uint256 v1,
        uint256 v2,
        string memory _name
    ) public {
        (bool success, ) = logic.delegatecall(
            abi.encodeWithSignature("batchSet(uint256,uint256,string)", v1, v2, _name)
        );
        require(success, "delegatecall failed");
    }
}