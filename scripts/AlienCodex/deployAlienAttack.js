// const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const [owner] = await ethers.getSigners();
    // We get the contract to deploy
    console.log(`Deploying from ${owner.address}`);
    const Contract = await ethers.getContractFactory("AlienCodexAttacker");
    const contract = await Contract.deploy("0xf65cb0EC80564a0c043d3E7d4A3d28CD0F506206");
    await contract.deployed();

    console.log(`AlienCodexAttacker contract deployed to: ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });