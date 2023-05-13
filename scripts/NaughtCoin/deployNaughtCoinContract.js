// const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const [owner] = await ethers.getSigners();
    // We get the contract to deploy
    console.log(`Deploying from ${owner.address}`);
    const Contract = await ethers.getContractFactory("NaughtCoinContract");
    const contract = await Contract.deploy("0x09642E5eef9d14E5C9E14610D2097d6DcCCfDA59");
    await contract.deployed();

    console.log(`NaughtCoinContract contract deployed to: ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });