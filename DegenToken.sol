// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    // Constructor to initialize the token with a name and symbol
    constructor() ERC20("DegenCoin", "DC") Ownable(msg.sender) {}

    // Function to mint new tokens, can only be called by the owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens, can be called by any token holder
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function to burn tokens from an account, can only be called by the store contract
    function burnFrom(address account, uint256 amount) public {
        _burn(account, amount);
    }

    // Wrapper function to transfer tokens
    function transferTokens(address to, uint256 amount) public returns (bool) {
        return transfer(to, amount);
    }
}
