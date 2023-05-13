const Web3 = require('web3');
const contractAddress = '0xb50417dCf6fedfD829cd3D154709F0EF481C943B';

const web3 = new Web3('https://sepolia.infura.io/v3/97dbad08403e493eafa271b85e5b2e93');

async function getPrivateData() {
  const slot = '0x5';
  const result = await web3.eth.getStorageAt(contractAddress, slot);
  console.log(result);
}

getPrivateData();