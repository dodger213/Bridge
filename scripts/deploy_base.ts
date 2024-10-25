
// Importing necessary functionalities from the Hardhat package.
import { ethers } from 'hardhat'

async function main() {
    // Retrieve the first signer, typically the default account in Hardhat, to use as the deployer.
    const [deployer] = await ethers.getSigners()
    console.log('Contract is deploying...')
    const instanceUSDC = await ethers.deployContract('MyToken');
    await instanceUSDC.waitForDeployment();
    const TokenAddress = await instanceUSDC.getAddress();
    console.log(`Token contract is deployed. Token address: ${instanceUSDC.target}`)

    const instanceBridge = await ethers.getContractFactory('ProxyOFTWithFee');
    const BridgeContract = await instanceBridge.deploy(TokenAddress, 8, "0x1a44076050125825900e736c501f859c50fE728c"); // base
    // Waiting for the contract deployment to be confirmed on the blockchain.
    await BridgeContract.waitForDeployment()

    // Logging the address of the deployed My404 contract.
    console.log(`Bridge contract is deployed. Token address: ${BridgeContract.target}`)
}

// This pattern allows the use of async/await throughout and ensures that errors are caught and handled properly.
main().catch(error => {
    console.error(error)
    process.exitCode = 1
})