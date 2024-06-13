# DegenToken Game Contract

The DegenToken Game contract is a decentralized Game platform built on the Ethereum blockchain. It enables users to redeem items from a store using a custom ERC20 token.

## Overview

The contract consists of several components:

1. **DegenToken**: This is an ERC20 token contract used as the currency within the Degen Game platform. Users can earn tokens as rewards and use them to redeem items from the store.

2. **ArmoryStore**: This contract represents the store where items are listed for redemption. It manages user accounts, store items, and the redemption process.

## Features

The ArmoryStore contract provides the following features:

- **Minting New Tokens**: The owner can mint new tokens and distribute them to users as rewards.

- **Transferring Tokens**: Users can transfer their tokens to others.

- **Redeeming Tokens**: Users can redeem their tokens for items in the in-game store.

- **Checking Token Balance**: Users can check their token balance at any time.

- **Burning Tokens**: Anyone can burn tokens that they own and are no longer needed.

## Usage

### Deploying the Contract

To deploy the contract, deploy both the DegenToken and ArmoryStore contracts to the Ethereum blockchain. Ensure that you deploy the DegenToken contract first and pass its address when deploying the ArmoryStore contract.

### Minting New Tokens

Only the owner of the contract can mint new tokens. To mint new tokens, call the `mint` function in the DegenToken contract.

### Transferring Tokens

Users can transfer their tokens to others by calling the `transfer` function in the DegenToken contract.

### Redeeming Tokens

Users can redeem their tokens for items from the store by calling the `redeem` function in the ArmoryStore contract.

### Checking Token Balance

Users can check their token balance at any time by calling the `balanceOf` function in the DegenToken contract.

### Burning Tokens

Anyone can burn tokens that they own and no longer need by calling the `burn` function in the DegenToken contract.

## Author
- 8202636. 
- Alexander Yeoj B. Bombais

## License

This contract is released under the MIT License. See [LICENSE](LICENSE) for details.
