// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface Istorage {
    function getNum() external view returns (uint256);
    function add() external;
}

contract contract2 {
    constructor() {}

    function proxyAdd() public {
        IStorage(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8).add();
    }

    function proxyGet() public view returns (uint256) {
        uint256 value = IStorage(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8).getNum();
        return value;
    }
}
