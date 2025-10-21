// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EventExample {
    // Deposit
    event Deposit(address indexed from, uint value);
    function deposit(uint value) public {
        // 触发事件
        emit Deposit(msg.sender, value);
    }
}



contract ERC20 {
    address public banker = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public owner;
    mapping(address => uint256) public balances;

   function getAddress() public view returns(address){
        return  address(this);
   }

   function getOwner() public view returns(address){
        return  msg.sender;
   }
}


//实现内联汇编的小案例
contract MyWallet { 
    string public name;
    mapping (address => bool) private approved;
    address public owner;

    modifier auth {
        address currentOwner;
        //通过内联汇编来获取owner对应槽位的值
        assembly {
            currentOwner := sload(owner.slot)
        }

        require (msg.sender == currentOwner, "Not authorized");
        _;
    }

    constructor(string memory _name) {
        name = _name;
        // address currentOwner;
        assembly {
            sstore(owner.slot,caller())  //caller() 是内联汇编的方法，与msg.sender 一致
        }
       
    }

    function transferOwernship(address _addr) public auth {
        require(_addr!=address(0), "New owner is the zero address");
        require(owner != _addr, "New owner is the same as the old owner");
        // owner = _addr;
        //内联汇编来对owner赋值
        assembly { 
            sstore(owner.slot,_addr)
        }
    }
}
