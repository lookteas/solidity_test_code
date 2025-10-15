//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint counter;

    uint public immutable onwer = 777;

    constructor() {
        counter = 0;
    }

    function add() public {
        counter = counter + 1;
    }

    function get() public view returns (uint) {
        return counter;
    }
}


