// const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const [owner] = await ethers.getSigners();
    // We get the contract to deploy
    console.log(`Deploying from ${owner.address}`);
    const Contract = await ethers.getContractFactory("Building");
    const contract = await Contract.deploy("0x05b4743CEdBc6b24ae53095f8711963AE0A77dd5");
    await contract.deployed();
    
    console.log(`Building contract deployed to: ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });