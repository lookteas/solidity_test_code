// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SmartPiggyBank {
    address public owner;
    
    // 记录每个用户的存款总额（只记录通过 deposit() 存的钱）
    mapping(address => uint256) public userDeposits;
    
    // 事件：记录存款行为
    event Deposited(address indexed user, uint256 amount, string method);
    event Withdrawn(address to, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    // =============== 方式 1：通过函数调用存款 ===============
    function deposit() public payable {
        require(msg.value > 0, "Must send ETH to deposit");
        
        // 累加用户的存款记录
        userDeposits[msg.sender] += msg.value;
        
        // 触发事件，标明是通过 "function call" 存的
        emit Deposited(msg.sender, msg.value, "function_call");
    }

    // =============== 方式 2：直接转账到合约地址（自动触发） ===============
    // receive() 是专门处理“纯 ETH 转账”（无 calldata）的特殊函数
    receive() external payable {
        require(msg.value > 0, "Must send ETH");
        
        // 注意：这里无法知道是谁转的？其实是知道的：msg.sender 就是转账人！
        // 但通常不建议在 receive 里修改复杂状态（Gas 限制），这里简单记录也可以
        userDeposits[msg.sender] += msg.value;
        
        emit Deposited(msg.sender, msg.value, "direct_transfer");
    }

    // =============== 取款：只有 owner 能取走所有钱 ===============
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        
        uint256 balance = address(this).balance;
        require(balance > 0, "No ETH to withdraw");
        
        // 使用 call 更安全（避免 transfer 的 2300 gas 限制问题）
        (bool sent, ) = payable(owner).call{value: balance}("");
        require(sent, "Failed to send ETH");
        
        emit Withdrawn(owner, balance);
    }

    // =============== 查看合约余额 ===============
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}