// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint public count = 0;
}

contract Factory {
    function create2(uint256 salt) public returns (address) {
        bytes32 _salt = keccak256(abi.encode(salt));
        Counter c = new Counter{salt: _salt}();
        return address(c);
    }
}
