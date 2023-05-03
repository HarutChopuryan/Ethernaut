// const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const [owner] = await ethers.getSigners();
    // We get the contract to deploy
    console.log(`Deploying from ${owner.address}`);
    const Contract = await ethers.getContractFactory("CoinAttacker");
    const contract = await Contract.deploy("0xD3Db4414AEC9a16Fff40f25aEC1752452484D29C");
    await contract.deployed();
    
    console.log(`CoinAttacker contract deployed to: ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });