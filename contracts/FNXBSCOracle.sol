pragma solidity >=0.6.0;
interface IPancakeRouter01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}
contract FNXBSCOracle {
    IPancakeRouter01 public routeV2 = IPancakeRouter01(0x05fF2B0DB69458A0750badebc4f9e13aDd608C7F);
    address public usd = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
    address public fnx = 0xdFd9e2A17596caD6295EcFfDa42D9B6F63F7B5d5;
    address[] public path = [fnx,usd];
    constructor() public {
    } 
    function decimals() external view returns (uint8){
        return 18;
    }
    function description() external view returns (string memory){
        return "FNX";
    }
    function version() external view returns (uint256){
        return 1;
    }

    // getRoundData and latestRoundData should both raise "No data present"
    // if they do not have data to report, instead of returning unset values
    // which could be misinterpreted as actual reported values.
    function getRoundData(uint80 _roundId)
        external
        view
        returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
        ){
        uint[] memory amounts = routeV2.getAmountsOut(1e8,path);
        int256 price = int256(amounts[amounts.length-1]);
        return (0,price,0,0,0);
    }
    function latestRoundData()
        external
        view
        returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
        ){
        uint[] memory amounts = routeV2.getAmountsOut(1e8,path);
        int256 price = int256(amounts[amounts.length-1]);
        return (0,price,0,0,0);
    }

}