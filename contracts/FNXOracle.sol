pragma solidity ^0.6.7;
import "./modules/Operator.sol";
import "./interfaces/AggregatorV3Interface.sol";
import "./interfaces/IERC20.sol";

contract FNXOracle is Operator {
    mapping(uint256 => AggregatorV3Interface) underlyingsMap;
    mapping(address => AggregatorV3Interface) assetsMap;
    mapping(uint256 => uint256) private priceMap;
    uint256 internal decimals = 1;

    /**
     * Network: Ropsten
     * Aggregator: LTC/USD
     * Address: 0x727B59d0989d6D1961138122BC9F94f534E82B32
     */
    constructor() public {
        underlyingsMap[1] = AggregatorV3Interface(0xECe365B379E1dD183B20fc5f022230C044d51404);
        underlyingsMap[2] = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        assetsMap[0x0000000000000000000000000000000000000000] = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        assetsMap[0x4738635C82BED8F474D9A078F4E5797fa5d5f460] = AggregatorV3Interface(0xa24de01df22b63d23Ebc1882a5E3d4ec0d907bFB);
    }
    function setDecimals(uint256 newDecimals) public onlyOwner{
        decimals = newDecimals;
    }
        /**
  * @notice retrieves price of an asset
  * @dev function to get price for an asset
  * @param asset Asset for which to get the price
  * @return uint mantissa of asset price (scaled by 1e8) or zero if unset or contract paused
  */
    function getPrice(address asset) public view returns (uint256) {
        AggregatorV3Interface assetsPrice = assetsMap[asset];
        if (address(assetsPrice) != address(0)){
            (, int price,,,) = assetsPrice.latestRoundData();
            if (asset != address(0)){
                IERC20 token = IERC20(asset);
                uint256 tokenDecimals = uint256(token.decimals());
                if (tokenDecimals < 18){
                    return uint256(price)/decimals*(10**(18-tokenDecimals));  
                }else if (tokenDecimals > 18){
                    return uint256(price)/decimals/(10**(18-tokenDecimals)); 
                }else{
                    return uint256(price)/decimals;
                }
            }
            return uint256(price)/decimals; 
        }else {
            return priceMap[uint256(asset)];
        }
    }
    function getUnderlyingPrice(uint256 underlying) public view returns (uint256) {
        AggregatorV3Interface assetsPrice = underlyingsMap[underlying];
        if (address(assetsPrice) != address(0)){
            (, int price,,,) = assetsPrice.latestRoundData();
            return uint256(price)/decimals; 
        }else {
            return priceMap[underlying];
        }
    }
    /**
      * @notice set price of an asset
      * @dev function to set price for an asset
      * @param asset Asset for which to set the price
      * @param price the Asset's price
      */    
    function setPrice(address asset,uint256 price) public onlyOperatorIndex(0) {
        priceMap[uint256(asset)] = price;

    }
    /**
      * @notice set price of an underlying
      * @dev function to set price for an underlying
      * @param underlying underlying for which to set the price
      * @param price the underlying's price
      */  
    function setUnderlyingPrice(uint256 underlying,uint256 price) public onlyOperatorIndex(0) {
        require(underlying>0 , "underlying cannot be zero");
        priceMap[underlying] = price;
    }
        /**
      * @notice set price of an asset
      * @dev function to set price for an asset
      * @param asset Asset for which to set the price
      * @param aggergator the Asset's aggergator
      */    
    function setAssetsAggregator(address asset,address aggergator) public onlyOwner {
        assetsMap[asset] = AggregatorV3Interface(aggergator);
    }
    /**
      * @notice set price of an underlying
      * @dev function to set price for an underlying
      * @param underlying underlying for which to set the price
      * @param aggergator the underlying's aggergator
      */  
    function setUnderlyingAggregator(uint256 underlying,address aggergator) public onlyOwner {
        require(underlying>0 , "underlying cannot be zero");
        underlyingsMap[underlying] = AggregatorV3Interface(aggergator);
    }
    function getAssetsAggregator(address asset) public view returns (address) {
        return address(assetsMap[asset]);
    }
    function getUnderlyingAggregator(uint256 underlying) public view returns (address) {
        return address(underlyingsMap[underlying]);
    }
}