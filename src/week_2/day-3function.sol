// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Func{

    //pure和view关键字的区别
    function pureFunc(uint a, uint b) public pure returns(uint){
        return a + b;
    }

    function viewFunc(uint a, uint b) public view returns(uint){
        return a + b + block.number;
    }
}