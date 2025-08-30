// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract BytesDataType {
    // b1
    bytes public b1 = "hello";
    // b2
    bytes public b2 = "world";

    string public str3;

     // isActive
    uint public a = 1;
    uint public b;
    int public c;
    bool public  isActive = true;

    function combine() public view returns (bytes memory) {
        //concat bytes
        string memory str = string.concat(string(b1), string(b2));
        bytes memory b3 = bytes(str);
        return b3;
    }

    function getString() public view returns (string memory) {
        return string(combine());
    }

    function setString() public {
        str3 = getString();
    }

    function resetStr3() public {
        str3 = "";
    }

    /**
    *布尔类型
    定义一个public bool类型变量isActive，默认值设为true
    补充完整switchStatus函数，每次调用时切换isActive状态
    *
    **/
    function switchStatus() public {
        // 
        isActive = !isActive;
    }

  

    
}
