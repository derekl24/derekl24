// This lightweight smart contract will use one of the "out of the box" oracle services. Specifically, we are importing the AggregatorV3Interface 
// that will allow me to call the functions that interact with the a Chainlink Data Feed contract.

pragma solidity ^0.6.7;

// Importing the interface from Chainlink
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract latestETHprice {
  AggregatorV3Interface public priceFeed;

  // Instantiate the AggregatorV3Interface using the address associated with the ETH/USD data feed contract deployed on the Rinkeby network
  constructor() public {
    priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
  }

  // Grab the latest price of Ethereum
  function getLatestPrice() public view returns (int) {
    (,int price,,,) = priceFeed.latestRoundData();
    return price;
  }
  
  // Show where the decimals should go for the price
  function getDecimals() public view returns (uint8) {
    uint8 decimals = priceFeed.decimals();
    return decimals;
  }
}
