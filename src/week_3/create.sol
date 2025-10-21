// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint public count = 0;
}

contract Factory {
    function create() public returns (address) {
        Counter c = new Counter(); // 这就是 CREATE
        return address(c);
    }
}