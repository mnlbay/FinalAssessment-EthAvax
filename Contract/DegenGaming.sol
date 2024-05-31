// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Define an item struct
    struct Item {
        string name;
        uint256 cost;
    }

    // Mapping to store available items in the in-game store
    mapping(string => Item) public items;

    // Mapping to store redeemed items for each player
    mapping(address => string[]) public redeemedItems;

    constructor(address initialOwner) ERC20("DegenToken", "DEGEN") Ownable(initialOwner) {
        // Add some example items to the store
        items["Legendary Sword"] = Item("Legendary Sword", 100);
        items["Epic Shield"] = Item("Epic Shield", 75);
        items["Rare Potion"] = Item("Rare Potion", 50);
    }

    // Mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Transfer tokens
    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    // Redeem tokens for items
    function redeem(string memory itemName) public returns (bool) {
        // Check if the item exists
        require(items[itemName].cost > 0, "Item not found");

        // Check if the player has enough tokens to redeem the item
        require(balanceOf(msg.sender) >= items[itemName].cost, "Insufficient balance");

        // Burn tokens and transfer the item to the player
        _burn(msg.sender, items[itemName].cost);

        // Record the redeemed item for the player
        redeemedItems[msg.sender].push(itemName);

        // Example: Player redeemed tokens for an item
        emit RedeemItems(msg.sender, itemName, items[itemName].cost);

        return true;
    }

    // Check token balance
    function balanceOf(address account) public view override returns (uint256) {
        return super.balanceOf(account);
    }

    // Burn tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Event to log item redemption
    event RedeemItems(address indexed account, string itemName, uint256 cost);

    // Function to get redeemed items for a player
    function getRedeemedItems(address account) public view returns (string memory) {
        string[] storage itemsArray = redeemedItems[account];
        if (itemsArray.length == 0) {
            return "No items redeemed";
        }

        string memory result = "Redeemed items in storage: ";
        for (uint i = 0; i < itemsArray.length; i++) {
            result = string(abi.encodePacked(result, "\n", itemsArray[i]));
        }
        return result;
    }
}
