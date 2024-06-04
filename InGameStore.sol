// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract InGameStore is Ownable {
    struct Item {
        string name;
        uint256 price;
        uint256 stock;
    }

    mapping(string => Item) private storeItems;
    string[] private itemNames;  // Array to store item names
    mapping(address => Item[]) private redeemedItems;
    IERC20 public token;

    event ItemAdded(string name, uint256 price, uint256 stock);
    event ItemRedeemed(address indexed user, string name, uint256 price);

    constructor(address tokenAddress) Ownable(msg.sender) {
        token = IERC20(tokenAddress);
    }

    // Add a new item to the store. Only the owner can call this function.
    function addItem(string memory name, uint256 price, uint256 stock) public onlyOwner {
        require(storeItems[name].stock == 0, "Item already exists");
        storeItems[name] = Item(name, price, stock);
        itemNames.push(name);  // Add item name to array
        emit ItemAdded(name, price, stock);
    }

    // Redeem tokens for an item from the store.
    function redeem(string memory name) public {
        Item storage item = storeItems[name];
        require(item.stock > 0, "Item out of stock");
        require(token.balanceOf(msg.sender) >= item.price, "Insufficient token balance");

        token.transferFrom(msg.sender, address(this), item.price);
        item.stock -= 1;
        redeemedItems[msg.sender].push(item);

        emit ItemRedeemed(msg.sender, name, item.price);
    }

    // Get the list of items a player has redeemed.
    function getRedeemedItems(address user) public view returns (Item[] memory) {
        return redeemedItems[user];
    }

    // Get the details of an item in the store.
    function getStoreItem(string memory name) public view returns (Item memory) {
        return storeItems[name];
    }

    // Get the list of available items in the store.
    function getStoreItems() public view returns (Item[] memory) {
        uint itemCount = itemNames.length;

        Item[] memory items = new Item[](itemCount);
        for (uint i = 0; i < itemCount; i++) {
            items[i] = storeItems[itemNames[i]];
        }

        return items;
    }
}
