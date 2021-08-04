pragma solidity ^0.6.7;
import "./PHXOracle.sol";
contract rinkebyOracle is PHXOracle {
    constructor() public {
        assetsMap[1] = AggregatorV3Interface(0xECe365B379E1dD183B20fc5f022230C044d51404);
        assetsMap[2] = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        assetsMap[3] = AggregatorV3Interface(0xd8bD0a1cB028a31AA859A21A3758685a95dE4623);
        assetsMap[4] = AggregatorV3Interface(0xE96C4407597CD507002dF88ff6E0008AB41266Ee);
        assetsMap[5] = AggregatorV3Interface(0xd8bD0a1cB028a31AA859A21A3758685a95dE4623);
        assetsMap[0] = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        assetsMap[uint256(0xb4b84C26D25b65A6d8c3cf1196634fC9302722Ae)] = AggregatorV3Interface(0xECe365B379E1dD183B20fc5f022230C044d51404);
        assetsMap[uint256(0xB469E9048eB0304B3479a526cAF442EC779e1e07)] = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        priceMap[uint256(0xB8f4bdf7dD0b45dEE51226A350611CEF2c007dd2)] = 1e20;
        priceMap[uint256(0x4f7cebCd409f258272E6aAbC35c342c9A55aD540)] = 1e20;
        priceMap[uint256(0x387B8eBde340e62e7F9cFA728352AF78baBCCeF6)] = 1e7;
        decimalsMap[0] = 18;
        decimalsMap[1] = 18;
        decimalsMap[2] = 18;
        decimalsMap[3] = 18;
        decimalsMap[4] = 18;
        decimalsMap[5] = 18;
        decimalsMap[uint256(0xB8f4bdf7dD0b45dEE51226A350611CEF2c007dd2)] = 6;
        decimalsMap[uint256(0x4f7cebCd409f258272E6aAbC35c342c9A55aD540)] = 6;
        decimalsMap[uint256(0xb4b84C26D25b65A6d8c3cf1196634fC9302722Ae)] = 8;
        decimalsMap[uint256(0xB469E9048eB0304B3479a526cAF442EC779e1e07)] = 18;
        decimalsMap[uint256(0x387B8eBde340e62e7F9cFA728352AF78baBCCeF6)] = 18;

    }
}