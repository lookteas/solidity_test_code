// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract toArray {
    //定长数组
    uint[10] tens;
    
    //变长数组
    uint[] public numbers; 

    //复制传值,numbers 指接受数值类型的元素值
    function copy(uint[] calldata arrs) public returns (uint len) {
        numbers = arrs;
        return numbers.length;
    }

    //测试
    function test(uint len) public pure {
        string[4] memory addArr = ["this", "is", "a", "array"];
        uint[] memory c = new uint[](len);
    }

    //修改数组元素的值
    function modiyNumbers() public  {
        uint[] storage  y = numbers;
        y[1] = 123;
    }

    //增加一个元素，只能数值类型
    //push 只能用于变长类型的数组操作，不可用于定长数组
    function add(uint x) public {
        numbers.push(x);
    }

}