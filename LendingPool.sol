// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LendingPool {
    IERC20 public lendingToken;
    mapping(address => uint256) public balances;
    mapping(address => uint256) public depositTimestamps;

    uint256 public interestRate = 10; // 10% annual interest

    constructor(IERC20 _lendingToken) {
        lendingToken = _lendingToken;
    }

    // Deposit tokens into the pool
    function deposit(uint256 amount) external {
        require(amount > 0, "Cannot deposit zero tokens");
        lendingToken.transferFrom(msg.sender, address(this), amount);

        // Calculate any interest earned before updating balance
        if (balances[msg.sender] > 0) {
            uint256 interest = calculateInterest(msg.sender);
            balances[msg.sender] += interest;
        }

        balances[msg.sender] += amount;
        depositTimestamps[msg.sender] = block.timestamp;
    }

    // Withdraw tokens plus interest
    function withdraw() external {
        uint256 balance = balances[msg.sender];
        require(balance > 0, "No balance to withdraw");

        uint256 interest = calculateInterest(msg.sender);
        uint256 total = balance + interest;

        balances[msg.sender] = 0;
        depositTimestamps[msg.sender] = 0;

        lendingToken.transfer(msg.sender, total);
    }

    // Calculate simple interest based on deposit time
    function calculateInterest(address user) public view returns (uint256) {
        uint256 depositTime = block.timestamp - depositTimestamps[user];
        uint256 annualInterest = (balances[user] * interestRate) / 100;
        return (annualInterest * depositTime) / 365 days;
    }
}
