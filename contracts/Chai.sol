//SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.9.0;

contract chai
{
    struct Memo
    {
        string name;
        string message;
        address from;
        uint timestamp;
    }

    Memo[] memos;
    address payable owner;

    constructor()
    {
        owner = payable(msg.sender);
    }

    function buyChai(string memory name, string memory message) public payable
    {
        require(msg.value > 0, "Please enter value greater than 0 eth");
        owner.transfer(msg.value);
        memos.push(Memo(name, message, msg.sender, block.timestamp));
    }

    function getMemos() public view returns(Memo[] memory)
    {
        return memos;
    }
}