// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
// 合约中库的使用
library Math {
    function max(uint a, uint b) internal pure returns (uint) {
        return a > b ? a : b;
    }

    function min(uint a, uint b) internal pure returns (uint) {
        return a < b ? a : b;
    }
}

contract LibraryExample {
    // 使用库
    using Math for uint;
    function max(uint x, uint y) public pure returns (uint) {
        //
        return Math.max(x, y);
    }

    function min(uint x, uint y) public pure returns (uint) {
        //
        return Math.min(x, y);
    }
}
