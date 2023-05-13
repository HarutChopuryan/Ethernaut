const Web3 = require('web3');
const contractAddress = '0x1cddd8F164A4B53088aFe101B51ce94a352Cefad';

const web3 = new Web3('https://sepolia.infura.io/v3/97dbad08403e493eafa271b85e5b2e93');

async function getPrivateData() {
  const slot = '0x1';
  const result = await web3.eth.getStorageAt(contractAddress, slot);
  console.log(result);
}

getPrivateData();