// const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const [owner] = await ethers.getSigners();
    // We get the contract to deploy
    console.log(`Deploying from ${owner.address}`);
    const Contract = await ethers.getContractFactory("NaughtCoinAttacker");
    const contract = await Contract.deploy("0xc88041633708a8B479CC44981dCb5348113606Dc");
    await contract.deployed();

    console.log(`NaughtCoinAttacker contract deployed to: ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });