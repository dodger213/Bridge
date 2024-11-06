# Bridge Contracts for Cross-Chain Asset Transfers

A decentralized bridge implementation that enables secure cross-chain transfers between Base Sepolia and Holesky networks.

## Overview

This project implements a bridge contract system allowing asset transfers between:
- Base Sepolia Chain
- Holesky Chain (Ethereum testnet)

## Technical Stack

- Hardhat Development Environment
- TypeScript
- Hardhat Ignition for deployment management
- Environment configuration via dotenv
- Testing framework with Chai assertions

## Key Features

- Secure cross-chain asset transfers
- Owner-controlled bridge deployment
- Automated testing suite
- Configurable deployment parameters

## Setup

1. Install dependencies:
```bash
npm install
```

2. Configure environment variables: Create a .env file with:

```bash
INFURA_API_KEY=your_infura_key
PRIVATE_KEY=your_private_key
ETHERSCAN_KEY=your_etherscan_key
BASESCAN_KEY=your_basescan_key
```

## Testing
Run tests:
```bash
npx hardhat test
```

## Deployment
1. Deploy the bridge contract:
```bash
npx hardhat run scripts/deploy.ts --network <network>
```

2. Verify the contract on Etherscan:
```bash
npx hardhat verify --network <network> <contract_address>
```

## Security

- Owner-controlled deployment
- Comprehensive test coverage
- Network-specific configurations

## Networks

- Base Sepolia: For Base testnet operations
- Holesky: For Ethereum testnet operations

## License

MIT
