// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./EcommerceToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EcommerceStore is Ownable {
    EcommerceToken private token;

    struct User {
        uint256 accountId;
        address userAddress;
    }

    struct Item {
        uint256 itemId;
        string name;
        uint256 price;
    }

    struct RedeemedItem {
        uint256 itemId;
        string name;
        uint256 amount;
    }

    mapping(uint256 => User) public users;
    mapping(address => uint256) public addressToAccountId;
    uint256 public nextUserId;

    mapping(uint256 => Item) public storeItems;
    uint256 public nextItemId;

    mapping(uint256 => RedeemedItem[]) public redeemedItems;

    constructor(address tokenAddress) Ownable(msg.sender) {
        token = EcommerceToken(tokenAddress);
    }

    function addUser(address userAddress) public onlyOwner {
        require(addressToAccountId[userAddress] == 0, "User already exists");
        uint256 accountId = nextUserId + 1;
        users[accountId] = User(accountId, userAddress);
        addressToAccountId[userAddress] = accountId;
        nextUserId++;
    }

    function addItem(string memory name, uint256 price) public onlyOwner {
        storeItems[nextItemId] = Item(nextItemId, name, price);
        nextItemId++;
    }

    function redeem(string memory itemName) public {
        require(addressToAccountId[msg.sender] != 0, "User not registered");

        uint256 itemId = findItemIdByName(itemName);
        require(itemId != 0, "Item not found");

        Item memory item = storeItems[itemId];
        uint256 totalPrice = item.price;
        require(token.balanceOf(msg.sender) >= totalPrice, "Insufficient token balance");

        token.burnFrom(msg.sender, totalPrice);
        redeemedItems[addressToAccountId[msg.sender]].push(RedeemedItem(itemId, item.name, 1));
    }

    function getRedeemedItems(uint256 accountId) public view returns (RedeemedItem[] memory) {
        require(users[accountId].userAddress != address(0), "Invalid account ID");
        return redeemedItems[accountId];
    }

    function getStoreItems() public view returns (Item[] memory) {
        Item[] memory items = new Item[](nextItemId);
        for (uint256 i = 0; i < nextItemId; i++) {
            items[i] = storeItems[i];
        }
        return items;
    }

    function getUserById(uint256 accountId) public view returns (User memory) {
        return users[accountId];
    }

    function getUserByAddress(address userAddress) public view returns (User memory) {
        uint256 accountId = addressToAccountId[userAddress];
        require(accountId != 0, "User not registered");
        return users[accountId];
    }

    function findItemIdByName(string memory itemName) internal view returns (uint256) {
        for (uint256 i = 0; i < nextItemId; i++) {
            if (keccak256(abi.encodePacked(storeItems[i].name)) == keccak256(abi.encodePacked(itemName))) {
                return i;
            }
        }
        return 0;
    }
}
