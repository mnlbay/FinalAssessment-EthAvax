# EcommerceStore Contract

The EcommerceStore contract is a decentralized e-commerce platform built on the Ethereum blockchain. It enables users to redeem items from a store using a custom ERC20 token.

## Overview

The contract consists of several components:

1. **EcommerceToken**: This is an ERC20 token contract used as the currency within the e-commerce platform. Users can earn tokens as rewards and use them to redeem items from the store.

2. **EcommerceStore**: This contract represents the store where items are listed for redemption. It manages user accounts, store items, and the redemption process.

## Features

The EcommerceStore contract provides the following features:

- **Minting New Tokens**: The owner can mint new tokens and distribute them to users as rewards.

- **Transferring Tokens**: Users can transfer their tokens to others.

- **Redeeming Tokens**: Users can redeem their tokens for items in the in-game store.

- **Checking Token Balance**: Users can check their token balance at any time.

- **Burning Tokens**: Anyone can burn tokens that they own and are no longer needed.

## Usage

### Deploying the Contract

To deploy the contract, deploy both the EcommerceToken and EcommerceStore contracts to the Ethereum blockchain. Ensure that you deploy the EcommerceToken contract first and pass its address when deploying the EcommerceStore contract.

### Minting New Tokens

Only the owner of the contract can mint new tokens. To mint new tokens, call the `mint` function in the EcommerceToken contract.

### Transferring Tokens

Users can transfer their tokens to others by calling the `transfer` function in the EcommerceToken contract.

### Redeeming Tokens

Users can redeem their tokens for items from the store by calling the `redeem` function in the EcommerceStore contract.

### Checking Token Balance

Users can check their token balance at any time by calling the `balanceOf` function in the EcommerceToken contract.

### Burning Tokens

Anyone can burn tokens that they own and no longer need by calling the `burn` function in the EcommerceToken contract.

## Testing

Before deploying the contract to the mainnet or any public testnet, it's recommended to thoroughly test the contract functionality on a local development environment or testnet.

## Author
- 8202636. 
- Alexander Yeoj B. Bombais

## License

This contract is released under the MIT License. See [LICENSE](LICENSE) for details.
