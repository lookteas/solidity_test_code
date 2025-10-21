// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VarDefault {

    //constant  关键字修饰的状态变量，必须在声明时就立即显式赋值，然后就不再允许修改了。
    //immutable  关键字修饰的状态变量，既可以在声明时显式赋值，还可以在合约部署时赋值，
    //也就是 immutable 在合约的构造函数 constructor 中赋值。但是，一旦赋值后就不能再修改了。
    //所以，immutable  比 constant 多了一个设置初值的机会，但是它花费的 gas 费要高一点。
    string constant SYMBOL = "WETH"; // 定义常量 SYMBOL
    uint8 public immutable DECIMALS = 18; // 声明时赋值
    uint256 public immutable TOTAL_SUPPLY;

    constructor() {
        TOTAL_SUPPLY = 1000; // 合约部署时赋值
    }

    //各种类型数据的默认值

    // 定义枚举类型
    enum status {
        normal,
        deleted
    } 

    bool public a; // false
    int256 public b; // 0
    uint256 public c; // 0
    address public d; // 0x0000...，共 40 个 0
    bytes32 public e; // 0x0000...，共 64 个 0
    string public f; // ""
    status public g; // 0，也就是 status.normal

    // 定义结构体 car
    struct car {
        string name;
        string carType;
        uint256 price;
    }

    car public mycar; // 默认值 {"", "", 0}
}
