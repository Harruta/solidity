// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Inheritence {
    uint256 startTime;
    uint256 tenYears;
    uint256 lastVisited;
    address owner;
    address recipient;

    constructor(address _recipient) {
        tenYears = 1 hours * 24 * 365 * 10;
        startTime = block.timestamp;
        lastVisited = block.timestamp;
        owner = msg.sender;
        recipient = _recipient;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyRecipient() {
        require(msg.sender == recipient);
        _;
    }

    function deposit() public payable onlyOwner {
        lastVisited = block.timestamp;
    }

    function ping() public onlyOwner {
        lastVisited = block.timestamp;
    }

    function claim() external onlyRecipient {
        require(lastVisited < block.timestamp - tenYears);
        payable(recipient).transfer(address(this).balance);
    }
}
