// This index.js code makes a batched JSON RPC call using the Alchemy APIs to read from the ethereum mainnet.
// The two methods I've used here are: (1) getting the metadata of a certain block, specifically block 436, and (2)
// getting the ETH balance of the latest block.

// To run this, use "npm install axios" then run "node index.js"


const axios = require('axios');

// copy-paste your URL from Alchemy
const ALCHEMY_URL = " <insert alchemy URL> ";

async function main() {
  const response = await axios.post(ALCHEMY_URL, [
  {
  jsonrpc: "2.0",
  id: 1,
  method: "eth_getBlockByNumber",
  params: [
    '0x1b4',
    true
  ]
  },
  {jsonrpc: "2.0",
  id: 2,
  method: "eth_getBalance",
  params: [
    '0xe6a7a1d47ff21b6321162aea7c6cb457d5476bca',
    'latest'
  ]
  }])

for (let i = 0; i < response.data.length; i++) {
  console.log(response.data[i].result)
}
};

main();
