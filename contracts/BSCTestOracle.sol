pragma solidity ^0.6.7;
import "./PHXOracle.sol";
contract BSCTestOracle is PHXOracle {
    constructor() public {
        assetsMap[1] = AggregatorV3Interface(0x5741306c21795FdCBb9b265Ea0255F499DFe515C);
        assetsMap[2] = AggregatorV3Interface(0x143db3CEEfbdfe5631aDD3E50f7614B6ba708BA7);
        assetsMap[5] = AggregatorV3Interface(0x1B329402Cb1825C6F30A0d92aB9E2862BE47333f);//link
        assetsMap[6] = AggregatorV3Interface(0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526);//bnb
        assetsMap[0] = AggregatorV3Interface(0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526);//bnb
        assetsMap[uint256(0xcc5f638f115585e2586Def94Ba038495D2d2c53d)] = AggregatorV3Interface(0x5741306c21795FdCBb9b265Ea0255F499DFe515C);
        assetsMap[uint256(0xfAFacC3F05B6292cFD25C6a7Bf61C9055040C25e)] = AggregatorV3Interface(0xfAFacC3F05B6292cFD25C6a7Bf61C9055040C25e);
        priceMap[uint256(0xA652f51ae200EBB9ad52107df02e41910917f797)] = 1e8;
        priceMap[uint256(0xF90465E93547484C21B872B8B4E2392CFB23D41d)] = 1e8;
        priceMap[uint256(0x35D93b993553117A485D2F8fabDF8Bb2d41FFcfB)] = 1e7;
        decimalsMap[0] = 18;
        decimalsMap[1] = 18;
        decimalsMap[2] = 18;
        decimalsMap[5] = 18;
        decimalsMap[6] = 18;
        decimalsMap[uint256(0xA652f51ae200EBB9ad52107df02e41910917f797)] = 18;
        decimalsMap[uint256(0xF90465E93547484C21B872B8B4E2392CFB23D41d)] = 18;
        decimalsMap[uint256(0xcc5f638f115585e2586Def94Ba038495D2d2c53d)] = 8;
        decimalsMap[uint256(0xfAFacC3F05B6292cFD25C6a7Bf61C9055040C25e)] = 18;
        decimalsMap[uint256(0x35D93b993553117A485D2F8fabDF8Bb2d41FFcfB)] = 18;

    }
}