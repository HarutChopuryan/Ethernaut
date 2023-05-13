// const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const [owner] = await ethers.getSigners();
    // We get the contract to deploy
    console.log(`Deploying from ${owner.address}`);
    const Contract = await ethers.getContractFactory("ReentranceAttacker");
    const contract = await Contract.deploy("0x7dC04941eCEf877F0abC6DE1d2C519517C6fc57f");
    await contract.deployed();

    console.log(`ReentranceAttacker contract deployed to: ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });