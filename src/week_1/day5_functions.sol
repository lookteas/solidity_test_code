// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract functionTypes{
    uint256 public number = 5;

    function add() external {
        number = number + 1;
    }

    //pure关键字, 纯旁观模式
    function addPure(uint256 _number) external pure returns(uint256 new_number) {
        new_number = _number + 1;
    }

    //pure读取模式
    function addView() external view returns(uint256 new_number) {
        new_number = number + 1;
    }

    //internal 和 external 区别
    function minus() internal {
        number = number - 1;
    }

    //合约内的函数可以调用内部函数
    function minusCall() external {
        minus();
    }

    //payable: 递钱，能给合约支付eth的函数
    function minusPayable() external payable returns(uint256 balance) {
        minus();
        balance = address(this).balance;
    }

    //`returns`：跟在函数名后面，用于声明返回的变量类型及变量名。
    //`return`：用于函数主体中，返回指定的变量。
    
    // return还可以返回多个变量
    function returnMultiple() public pure returns(uint256, bool, uint256[3] memory) {
        return(3, false, [uint256(3),7,9]);

        //返回如下内容： 
        // 0:uint256: 3
        // 1:bool: false
        // 2:uint256[3]: 3,7,9
        //这里`uint256[3]`声明了一个长度为`3`且类型为`uint256`的数组作为返回值。因为`[1,2,3]`会默认为`uint8(3)`
        //因此`[uint256(1),2,5]`中首个元素必须强转`uint256`来声明该数组内的元素皆为此类型。数组类型返回值默认必须用memory修饰
    
    }

    //命名式返回
    function returnNamed() public pure returns(uint256 _number, bool is_bool, uint256[3] memory _array) {
        _number = 379;
        is_bool = true;
        _array = [uint256(3),77,79];
    }

    // 命名式返回，依然支持return
    function returnNamed2() public pure returns(uint256 _number, bool is_bool, uint256[3] memory _array) {
        return(379, false, [uint(3),77,99]);
    }

    //解构式赋值规则来读取函数的全部或部分返回值
    function readReturn() public pure {
        uint256 _number;
        bool is_bool;
        bool is_bool2;
        uint256[3] memory _array;
        (_number, is_bool, _array) = returnNamed();

        //读取部分返回值：声明要读取的返回值对应的变量，不读取的留空。
        (, is_bool2,) = returnNamed();
    }

}