// const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const [owner] = await ethers.getSigners();
    // We get the contract to deploy
    console.log(`Deploying from ${owner.address}`);
    const Contract = await ethers.getContractFactory("KingAttacker");
    const contract = await Contract.deploy("0x2a6a27bF8Ce38aC83c733CAaCd4e8d944742581A");
    await contract.deployed();

    console.log(`KingAttacker contract deployed to: ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });