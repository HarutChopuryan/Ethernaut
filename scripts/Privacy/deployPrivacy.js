// const hre = require("hardhat");
const { ethers, upgrades } = require("hardhat");

async function main() {
    const [owner] = await ethers.getSigners();
    // We get the contract to deploy
    console.log(`Deploying from ${owner.address}`);
    const Contract = await ethers.getContractFactory("PrivacyContract");
    let arguments = [
                        ethers.utils.formatBytes32String("123"),
                        ethers.utils.formatBytes32String("456"),
                        ethers.utils.formatBytes32String("789")
                    ]
    const contract = await Contract.deploy(arguments);
    await contract.deployed();

    console.log(`PrivacyContract contract deployed to: ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });