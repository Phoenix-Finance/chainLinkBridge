pragma solidity ^0.6.7;
import "./PHXOracle.sol";
contract rinkebyOracle is PHXOracle {
    constructor() public {
        assetsMap[1] = AggregatorV3Interface(0xF4030086522a5bEEa4988F8cA5B36dbC97BeE88c);
        assetsMap[2] = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        assetsMap[3] = AggregatorV3Interface(0x24551a8Fb2A7211A25a17B1481f043A8a8adC7f2);
        assetsMap[4] = AggregatorV3Interface(0xDC3EA94CD0AC27d9A86C180091e7f78C683d3699);
        assetsMap[5] = AggregatorV3Interface(0x2c1d072e956AFFC0D435Cb7AC38EF18d24d9127c);
        assetsMap[0] = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        assetsMap[uint256(0xeF9Cd7882c067686691B6fF49e650b43AFBBCC6B)] = AggregatorV3Interface(0x80070f7151BdDbbB1361937ad4839317af99AE6c);
        priceMap[uint256(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48)] = 1e20;
        decimalsMap[0] = 18;
        decimalsMap[1] = 18;
        decimalsMap[2] = 18;
        decimalsMap[3] = 18;
        decimalsMap[4] = 18;
        decimalsMap[5] = 18;
        decimalsMap[uint256(0xeF9Cd7882c067686691B6fF49e650b43AFBBCC6B)] = 18;
        decimalsMap[uint256(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48)] = 6;
    }
}