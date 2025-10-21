// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    //无符号整型
    uint256 counter;
    //有符号整型
    int256 num_1;
    int256 num_2;
    int256 add_num; //加法结果
    int256 sub_num; //减法结果
    int256 mul_num; //乘法结果
    int256 div_num; //除法结果

    //布尔类型
    bool public bol_a = false;
    bool public bol_b = true;

    //字符串类型
    string str1 = "hello: ";

    //地址类型
    address public user;

    //构造函数
    constructor() {
        //编译时自动赋值
        counter = 0;
        num_1 = 3;
        num_2 = 7;
    }

    //给整型变量赋值操作
    function set(int256 _num1, int256 _num2) public {
        num_1 = _num1;
        num_2 = _num2;
    }

    //算术运算符
    function operator() public {
        add_num = num_1 + num_2; //加法
        sub_num = num_1 - num_2; //减法
        mul_num = num_1 * num_2; //乘法
        div_num = num_1 / num_2; //除法
        counter = counter + 1;
    }

    //计数器
    function get() public view returns (uint256,int256,int256,int256,int256) {
        return (counter, add_num, sub_num, mul_num, div_num);
    }

    //字符串合并操作
    function strCombine() public view returns (string memory) {
        string memory str2 = "Solidity";
        string memory strcom = string.concat(str1, str2);
        return strcom;
    }

    //地址相关操作
    function getuserAddress() public returns (address) {
        user = msg.sender;
        return user;
    }

    // 统一收集并返回地址和余额
    function getUserInfo() public view returns (address, uint256) {
        address userAddr = msg.sender;
        uint256 userBal = userAddr.balance;
        return (userAddr, userBal);
    }
}
