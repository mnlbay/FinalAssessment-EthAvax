// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EcommerceToken is ERC20, Ownable {

    constructor() ERC20("EcommerceToken", "ECT") Ownable(msg.sender) {}


    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

 
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }


    function burnFrom(address account, uint256 amount) public {
        _burn(account, amount);
    }

    function transferTokens(address to, uint256 amount) public returns (bool) {
        return transfer(to, amount);
    }
}
