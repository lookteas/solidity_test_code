//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint private counter;
    uint private constant TEN = 10;
    // uint private immutable TTHOLD;

    constructor() {
        counter = 0;
        // THOLD = t;
    }

    function add() public {
        counter = counter + TEN;
    }

    function get() public view returns (uint,uint) {
        return (counter, TEN);
        // return counter;
    }
}