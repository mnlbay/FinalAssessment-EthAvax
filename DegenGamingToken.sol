// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    constructor(address initialOwner) ERC20("DegenGamingToken", "DGT") Ownable(initialOwner) {
}


    // Mint new tokens
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Burn tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
  // Transfer tokens from one address to another
    function transfer(address recipient, uint256 amount) public override {
        // Call the internal ERC20 `_transfer` function for secure transfers
        _transfer(msg.sender, recipient, amount);
    }

}
