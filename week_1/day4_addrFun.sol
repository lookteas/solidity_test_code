pragma solidity ^0.8.0;

contract AddressDataType {
    // wallet 
    address public wallet = 0x98a4ED8a8BCCf75E0c3b8fA8749F4Fb7E8D80018;
    constructor() {
        
    }

    function checkBalance() public view returns (uint) {
        // 
        return wallet.balance;
    }

    function sendEth(uint amount) public {
        //
        payable(wallet).transfer(amount); 
    }
}
