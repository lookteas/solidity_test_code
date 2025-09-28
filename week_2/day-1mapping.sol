// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract Mapping {
    mapping (uint => address) public idToAddress; //id映射到地址

    struct Student{
        uint256 id;  //学号
        uint256 score; //分数
        bool status;
    }

    Student[] public students; // 存储学生列表

    // 向映射中写入键值对
    function writeMap(uint _key, address _value) public {
        idToAddress[_key] = _value;
    }

    // 根据索引获取学生信息
    function getStudent(uint256 _index) public view returns (uint256 id, uint256 score, bool status) {
        Student storage sdtinfo = students[_index];
        return (sdtinfo.id, sdtinfo.score, sdtinfo.status);
    }

    // 添加新学生到数组
    function addStudent(uint256 id, uint256 score, bool status) public {
        students.push(Student(id, score, status));
    }
}



/***
- **原理1**: 映射不储存任何键（`Key`）的资讯，也没有length的资讯。

- **原理2**: 对于映射使用`keccak256(h(key) . slot)`计算存取value的位置。感兴趣的可以去阅读 [WTF Solidity 内部规则: 映射存储布局](https://github.com/WTFAcademy/WTF-Solidity-Internals/tree/master/tutorials/02_MappingStorage)

- **原理3**: 因为Ethereum会定义所有未使用的空间为0，所以未赋值（`Value`）的键（`Key`）初始值都是各个type的默认值，如uint的默认值是0。

****/


/***
- **规则1**：映射的`_KeyType`只能选择Solidity内置的值类型，比如`uint`，`address`等，不能用自定义的结构体。而`_ValueType`可以使用自定义的类型。下面这个例子会报错，因为`_KeyType`使用了我们自定义的结构体：

- **规则2**：映射的存储位置必须是`storage`，因此可以用于合约的状态变量，函数中的`storage`变量和library函数的参数（见[例子](https://github.com/ethereum/solidity/issues/4635)）。不能用于`public`函数的参数或返回结果中，因为`mapping`记录的是一种关系 (key - value pair)。

- **规则3**：如果映射声明为`public`，那么Solidity会自动给你创建一个`getter`函数，可以通过`Key`来查询对应的`Value`。

- **规则4**：给映射新增的键值对的语法为`_Var[_Key] = _Value`，其中`_Var`是映射变量名，`_Key`和`_Value`对应新增的键值对。
***/