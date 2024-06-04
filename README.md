# Project: Degen Token (ERC-20): Unlocking the Future of Gaming

## Combined README for In-Game Store and DegenToken Contracts

This document provides an overview of two interconnected Solidity contracts:

**1. InGameStore.sol**

This contract implements a system for managing in-game items within a decentralized application (dApp). Players can use an ERC20 token (DegenToken) to redeem items from the store.

**Features:**

* **Item Management:**
    * Add new items with name, price, and stock.
    * Track available stock for each item.
* **Redemption:**
    * Players can redeem items using DegenTokens.
    * Secure token transfer using `transferFrom`.
* **Information Retrieval:**
    * Get details of an item by name.
    * View a player's redeemed items.
    * Get a list of available items in the store.
* **Player Functions:**
    * View DegenToken balance using `balanceOf`.
    * Transfer DegenTokens to other players using `transfer`.

**2. DegenToken.sol**

This contract defines a custom ERC20 token (DegenToken) used for in-game purchases in the `InGameStore.sol` contract.

**Features:**

* Implements the ERC20 standard for token management.
* Allows the owner (defined in the constructor) to mint new tokens.
* Enables token burning by the owner or token holders.
* Allows users to transfer their tokens to another account address
* Allows user to view their currenct amount of token in their balancce

**Integration:**

The `InGameStore.sol` contract interacts with the `DegenToken.sol` contract in the following way:

* The `InGameStore` constructor takes the address of the deployed `DegenToken` contract.
* When a player redeems an item, the `InGameStore` uses `transferFrom` to transfer the required amount of `DegenToken` from the player's wallet to the contract's address.

**Deployment and Usage:**

1. **Deploy DegenToken:**
    Compile and deploy `DegenToken.sol`.
    Note the address of the deployed `DegenToken` contract.

2. **Deploy InGameStore:**
    Compile and deploy `InGameStore.sol`.
    Provide the address of the deployed `DegenToken` contract in the `InGameStore` constructor.

3. **Usage:**
    Use functions from `InGameStore.sol` to manage in-game items and interact with players.
    Use the `balanceOf` function of the `DegenToken` contract to view a player's balance.
    Use the `transfer` function of the `DegenToken` contract to transfer tokens between players.

**Important Notes:**

* This is a sample implementation and may need further security considerations before production deployment.
* Proper testing is crucial for both contracts.

**Author:**
Bombais, Alexander Yeoj B.
8202636

**License:**

Both contracts are licensed under the MIT License (see LICENSE file).










