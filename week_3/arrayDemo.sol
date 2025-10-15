// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract demoArray {
    struct User {
        uint id;
        string name;
        uint balance;
    }

    //on user struct 
    User[] public users;

    //one mapping struct
    mapping(address => uint) public addressToUserId;

    //one mapping id=>user;
    mapping(uint => User) public idToUser;

    //下一个可用的用户ID
    uint public nextUserId = 1;

    // 事件，用于记录日志
    event UserRegistered(uint userID, address userAddress, string name);

    function registerUser(string memory _name) public {
        //检查调用者是否已经注册
        require(addressToUserId[msg.sender] == 0, "already register");

        //创建一个新的user结构体实列 暂时存放在memory中
        User memory newUser = User({
            id:nextUserId,
            name: _name,
            balance: 100
        });

        users.push(newUser);


        // 2. 更新地址到用户ID的映射
        addressToUserId[msg.sender] = nextUserId;

        //// 注意：这里我们直接将memory结构体赋值给storage映射中的一个位置
        idToUser[nextUserId] = newUser;


        // 发出事件
        emit UserRegistered(nextUserId, msg.sender, _name);

        // 递增ID，为下一个用户准备
        nextUserId++;

    }


    /**
     * 通过数组索引获取用户（演示数组查询）
     * 这是一个自动生成的getter函数，因为users数组是public的。
     * 但我们也手动写一个功能类似的函数来演示。
     */
    function getUserByIndex(uint _index) public view returns (uint, string memory, uint) {
        require(_index < users.length, "Index out of bounds");
        // 从storage数组中通过索引获取元素
        User storage user = users[_index];
        return (user.id, user.name, user.balance);
    }

    /**
     * 通过用户地址获取用户信息（演示映射查询）
     * 1. 先通过 addressToUserId 映射找到用户ID
     * 2. 再通过 idToUser 映射找到完整的用户结构体
     */
    function getUserByAddress(address _userAddress) public view returns (uint, string memory, uint) {
        uint userId = addressToUserId[_userAddress];
        require(userId != 0, "User not found");

        // 从storage映射中通过键（userId）获取值（User结构体）
        User storage user = idToUser[userId];
        return (user.id, user.name, user.balance);
    }

    /**
     * 获取注册用户的总数（演示数组的 .length 属性）
     */
    function getTotalUsers() public view returns (uint) {
        return users.length;
    }

    /**
     * 更新用户余额（演示如何修改storage中的结构体）
     */
    function updateUserBalance(uint _userId, uint _newBalance) public {
        // 直接从映射中获取该用户的storage引用
        User storage user = idToUser[_userId];
        require(user.id != 0, "User does not exist"); // 检查用户是否存在

        // 通过引用直接修改storage中的数据
        user.balance = _newBalance;
        // 注意：users数组中的对应元素不会被自动更新，因为它们是独立的拷贝！
        // 在实际项目中，你需要确保数据一致性，或者只使用一种主要的数据存储方式。
    }



    
}