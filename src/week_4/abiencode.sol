// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13; // 升级以支持 abi.encodeCall

contract DataStorage {
    string private data;

    function setData(string memory newData) public {
        data = newData;
    }

    function getData() public view returns (string memory) {
        return data;
    }
}

contract DataConsumer {
    address private dataStorageAddress;

    constructor(address _dataStorageAddress) {
        dataStorageAddress = _dataStorageAddress;
    }

    function getDataByABI() public returns (string memory) {
        // 使用 abi.encodeWithSignature 编码 getData() 调用
        bytes memory payload = abi.encodeWithSignature("getData()");
        (bool success, bytes memory result) = dataStorageAddress.call(payload);
        require(success, "call function failed");
        
        // 解码返回值：getData() 返回 string
        return abi.decode(result, (string));
    }

    function setDataByABI1(string calldata newData) public returns (bool) {
        // 使用 abi.encodeWithSignature 编码 setData(string)
        bytes memory payload = abi.encodeWithSignature("setData(string)", newData);
        (bool success, ) = dataStorageAddress.call(payload);
        return success;
    }

    function setDataByABI2(string calldata newData) public returns (bool) {
        // 获取 setData 函数的选择器（注意参数类型是 string）
        bytes4 selector = bytes4(keccak256(bytes("setData(string)")));
        // 或者更安全的方式（如果能引用接口）：
        // bytes4 selector = DataStorage.setData.selector;

        // 使用 abi.encodeWithSelector 编码
        bytes memory payload = abi.encodeWithSelector(selector, newData);

        (bool success, ) = dataStorageAddress.call(payload);
        return success;
    }

    function setDataByABI3(string calldata newData) public returns (bool) {
        // 使用 abi.encodeCall（推荐方式，类型安全）
        // 需要目标函数的函数类型引用
        (bool success, ) = dataStorageAddress.call(
            abi.encodeCall(DataStorage.setData, (newData))
        );
        return success;
    }
}