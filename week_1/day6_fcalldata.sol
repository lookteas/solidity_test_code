// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DataStorage {
    uint[] x = [1,2,3];
    //`calldata`：和`memory`类似，存储在内存中，不上链。与`memory`的不同点在于`calldata`变量不能修改（`immutable`），一般用于函数的参数
    function fCalldata(uint[] calldata _x) public pure returns(uint[] calldata) {
        return(_x);
    }

    function fStorage() public {
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }
}


//变量类型
contract Variables {
    uint public x = 1;
    uint public y;
    string public z;
    

    function foo() external{
        // 可以在函数里更改状态变量的值
        x = 5;
        y = 2;
        z = "0xAA";
    }

    function bar() external pure returns(uint){
        //局部变量的数据存储在内存里，不上链
        uint xx = 1;
        uint yy = 3;
        uint zz = xx + yy;
        return(zz);
    }


    //全局变量是全局范围工作的变量，都是`solidity`预留关键字。他们可以在函数内不声明直接使用
    function global() external view returns(address, uint, bytes memory){
        address sender = msg.sender;   //请求发起地址
        uint blockNum = block.number;   //当前区块高度
        bytes memory data = msg.data;   //请求数据
        return(sender, blockNum, data);
    }


    //全局变量-以太单位
    function weiUnit() external pure returns(uint) {
        assert(1 wei == 1e0);  //wei: 1
        assert(1 wei == 1);     
        return 1 wei;
    }

    //gwei: 1e9 = 1000000000
    function gweiUnit() external pure returns(uint) {
        assert(1 gwei == 1e9);
        assert(1 gwei == 1000000000);
        return 1 gwei;
    }


    //ether: 1e18 = 1000000000000000000
    function etherUnit() external pure returns(uint) {
        assert(1 ether == 1e18);
        assert(1 ether == 1000000000000000000);
        return 1 ether;
    }



    //全局变量-时间单位
    /**
    - `seconds`: 1
    - `minutes`: 60 seconds = 60
    - `hours`: 60 minutes = 3600
    - `days`: 24 hours = 86400
    - `weeks`: 7 days = 604800
    **/
    function secondsUnit() external pure returns(uint) {
        assert(1 seconds == 1);
        return 1 seconds;
    }

    function minutesUnit() external pure returns(uint) {
        assert(1 minutes == 60);
        assert(1 minutes == 60 seconds);
        return 1 minutes;
    }

    function hoursUnit() external pure returns(uint) {
        assert(1 hours == 3600);
        assert(1 hours == 60 minutes);
        return 1 hours;
    }

    function daysUnit() external pure returns(uint) {
        assert(1 days == 86400);
        assert(1 days == 24 hours);
        return 1 days;
    }

    function weeksUnit() external pure returns(uint) {
        assert(1 weeks == 604800);
        assert(1 weeks == 7 days);
        return 1 weeks;
    }



}