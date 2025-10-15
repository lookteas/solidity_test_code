// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ArrayCRUD {
    // 动态数组
    uint[] public numbers;
    
    // 结构体数组示例
    struct User {
        uint id;
        string name;
        bool isActive;
    }
    User[] public users;
    uint public nextUserId = 1;
    
    // 事件
    event NumberAdded(uint indexed number);
    event NumberUpdated(uint indexed index, uint oldValue, uint newValue);
    event NumberDeleted(uint indexed index, uint value);
    event UserAdded(uint indexed userId, string name);
    event UserUpdated(uint indexed userId, string oldName, string newName);
    event UserDeleted(uint indexed userId);
    
    // ========== 数字数组操作 ==========
    
    // 增 - 添加元素
    function addNumber(uint _number) public {
        numbers.push(_number);
        emit NumberAdded(_number);
    }
    
    // 查 - 获取所有元素
    function getAllNumbers() public view returns (uint[] memory) {
        return numbers;
    }
    
    // 查 - 根据索引获取元素
    function getNumber(uint _index) public view returns (uint) {
        require(_index < numbers.length, "Index out of bounds");
        return numbers[_index];
    }
    
    // 改 - 更新元素
    function updateNumber(uint _index, uint _newValue) public {
        require(_index < numbers.length, "Index out of bounds");
        uint oldValue = numbers[_index];
        numbers[_index] = _newValue;
        emit NumberUpdated(_index, oldValue, _newValue);
    }
    
    // 删 - 删除元素（保留顺序）
    function deleteNumberKeepOrder(uint _index) public {
        require(_index < numbers.length, "Index out of bounds");
        
        uint value = numbers[_index];
        
        // 将后面的元素前移
        for (uint i = _index; i < numbers.length - 1; i++) {
            numbers[i] = numbers[i + 1];
        }
        numbers.pop(); // 删除最后一个元素
        
        emit NumberDeleted(_index, value);
    }
    
    // 删 - 删除元素（不保留顺序，更高效）
    function deleteNumber(uint _index) public {
        require(_index < numbers.length, "Index out of bounds");
        
        uint value = numbers[_index];
        uint lastIndex = numbers.length - 1;
        
        if (_index != lastIndex) {
            numbers[_index] = numbers[lastIndex];
        }
        numbers.pop();
        
        emit NumberDeleted(_index, value);
    }
    
    // 获取数组长度
    function getNumbersLength() public view returns (uint) {
        return numbers.length;
    }
    
    // ========== 结构体数组操作 ==========
    
    // 增 - 添加用户
    function addUser(string memory _name) public {
        users.push(User({
            id: nextUserId,
            name: _name,
            isActive: true
        }));
        emit UserAdded(nextUserId, _name);
        nextUserId++;
    }
    
    // 查 - 获取所有用户
    function getAllUsers() public view returns (User[] memory) {
        return users;
    }
    
    // 查 - 根据ID查找用户
    function getUserById(uint _userId) public view returns (User memory) {
        for (uint i = 0; i < users.length; i++) {
            if (users[i].id == _userId) {
                return users[i];
            }
        }
        revert("User not found");
    }
    
    // 查 - 根据索引获取用户
    function getUserByIndex(uint _index) public view returns (User memory) {
        require(_index < users.length, "Index out of bounds");
        return users[_index];
    }
    
    // 改 - 更新用户信息
    function updateUser(uint _userId, string memory _newName) public {
        for (uint i = 0; i < users.length; i++) {
            if (users[i].id == _userId) {
                string memory oldName = users[i].name;
                users[i].name = _newName;
                emit UserUpdated(_userId, oldName, _newName);
                return;
            }
        }
        revert("User not found");
    }
    
    // 删 - 软删除用户（标记为不活跃）
    function softDeleteUser(uint _userId) public {
        for (uint i = 0; i < users.length; i++) {
            if (users[i].id == _userId) {
                users[i].isActive = false;
                emit UserDeleted(_userId);
                return;
            }
        }
        revert("User not found");
    }
    
    // 删 - 硬删除用户（从数组中移除）
    function hardDeleteUser(uint _userId) public {
        for (uint i = 0; i < users.length; i++) {
            if (users[i].id == _userId) {
                // 使用高效删除方法（不保留顺序）
                uint lastIndex = users.length - 1;
                if (i != lastIndex) {
                    users[i] = users[lastIndex];
                }
                users.pop();
                emit UserDeleted(_userId);
                return;
            }
        }
        revert("User not found");
    }
    
    // 获取活跃用户数量
    function getActiveUsersCount() public view returns (uint) {
        uint count = 0;
        for (uint i = 0; i < users.length; i++) {
            if (users[i].isActive) {
                count++;
            }
        }
        return count;
    }
    
    // 批量操作示例
    function addMultipleNumbers(uint[] memory _numbers) public {
        for (uint i = 0; i < _numbers.length; i++) {
            numbers.push(_numbers[i]);
            emit NumberAdded(_numbers[i]);
        }
    }
    
    // 清空数组
    function clearNumbers() public {
        delete numbers;
    }
}