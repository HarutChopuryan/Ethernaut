// const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const [owner] = await ethers.getSigners();
    // We get the contract to deploy
    console.log(`Deploying from ${owner.address}`);
    const Contract = await ethers.getContractFactory("DetectionBot");
    const contract = await Contract.deploy("0x15e1872EBA0313B53e4890674b6B15Ed32EAa968");
    await contract.deployed();

    console.log(`DetectionBot contract deployed to: ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });