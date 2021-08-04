pragma solidity ^0.6.7;
import "./PHXOracle.sol";
contract polygonOracle is PHXOracle {
    constructor() public {
        //btc
        assetsMap[1] = AggregatorV3Interface(0xc907E116054Ad103354f2D350FD2514433D57F6f);
        assetsMap[2] = AggregatorV3Interface(0xF9680D99D6C9589e2a93a78A04A279e509205945);
        assetsMap[0] = AggregatorV3Interface(0xAB594600376Ec9fD91F8e885dADF0CE036862dE0);

        assetsMap[uint256(0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6)] = AggregatorV3Interface(0xc907E116054Ad103354f2D350FD2514433D57F6f);
        assetsMap[uint256(0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619)] = AggregatorV3Interface(0xF9680D99D6C9589e2a93a78A04A279e509205945);
        assetsMap[uint256(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174)] = AggregatorV3Interface(0xfE4A8cc5b5B2366C1B58Bea3858e81843581b2F7);
        assetsMap[uint256(0xc2132D05D31c914a87C6611C10748AEb04B58e8F)] = AggregatorV3Interface(0x0A6513e40db6EB1b165753AD52E80663aeA50545);
        priceMap[uint256(0x9C6BfEdc14b5C23E3900889436Edca7805170f01)] = 1e7;
        decimalsMap[0] = 18;
        decimalsMap[1] = 18;
        decimalsMap[2] = 18;
        decimalsMap[3] = 18;
        decimalsMap[4] = 18;
        decimalsMap[5] = 18;
        decimalsMap[uint256(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174)] = 6;
        decimalsMap[uint256(0xc2132D05D31c914a87C6611C10748AEb04B58e8F)] = 6;
        decimalsMap[uint256(0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6)] = 8;
        decimalsMap[uint256(0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619)] = 18;
        decimalsMap[uint256(0x9C6BfEdc14b5C23E3900889436Edca7805170f01)] = 18;

    }
}