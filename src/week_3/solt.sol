// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract MyWallet { 
    string public name;
    mapping (address => bool) private approved;
    address public owner;

    modifier auth {
        require (msg.sender == owner, "Not authorized");
        _;
    }

    constructor(string memory _name) {
        name = _name;
        owner = msg.sender;
    } 

    function transferOwernship(address _addr) public auth {
        require(_addr!=address(0), "New owner is the zero address");
        require(owner != _addr, "New owner is the same as the old owner");
        owner = _addr;
    }
}



contract MyWallet2 {
    string public name;
    mapping(address => bool) private approved;
    address public owner;

    modifier auth() {
        address currentOwner;
        // 使用内联汇编获取 owner 值
        assembly {
            currentOwner := sload(owner.slot)
        }
        require(msg.sender == currentOwner, "Not authorized");
        _;
    }

    constructor(string memory _name) {
        name = _name;
        // 使用内联汇编设置 owner 值
        assembly {
            sstore(owner.slot, caller())
        }
    }

    function transferOwnership(address _addr) public auth {
        require(_addr != address(0), "New owner is the zero address");
        
        address currentOwner;
        // 使用内联汇编获取当前 owner 值进行比较
        assembly {
            currentOwner := sload(owner.slot)
        }
        require(currentOwner != _addr, "New owner is the same as the old owner");
        
        // 使用内联汇编设置新的 owner 值
        assembly {
            sstore(owner.slot, _addr)
        }
    }
}

