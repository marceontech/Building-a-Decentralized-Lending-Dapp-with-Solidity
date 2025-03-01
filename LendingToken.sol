// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LendingToken is ERC20 {
    constructor() ERC20("LendingToken", "LTN") {
        // Mint initial supply to the deployer
        _mint(msg.sender, 1000000 * 10**18); // 1 million tokens
    }
}
