let Web3 = require("Web3")
const fs = require('fs');
let collateral0 = "0x0000000000000000000000000000000000000000";
let web3 = new Web3(new Web3.providers.HttpProvider("https://main-light.eth.linkpool.io"));
let FNXOracle = require("../build/contracts/FNXOracle.json");
let AggregatorV3Interface = require("../build/contracts/AggregatorV3Interface.json");
let ImpliedVolatility = require("../build/contracts/ImpliedVolatility.json");
let daySeconds = 24*3600;
async function rinkebyQuery(){
    let chainLink = await new web3.eth.Contract(AggregatorV3Interface.abi,"0x8fFfFfd4AfB6115b954Bd326cbe7B4BA576818f6")
    let result = await chainLink.methods.latestRoundData().call();
    console.log(result);
    chainLink = await new web3.eth.Contract(AggregatorV3Interface.abi,"0x3E7d1eAB13ad0104d2750B8863b489D65364e32D")
    result = await chainLink.methods.latestRoundData().call();
    console.log(result);
    let oracle = await new web3.eth.Contract(FNXOracle.abi,"0x43BD92bF3Bb25EBB3BdC2524CBd6156E3Fdd41F3");
    let btcPrice = await oracle.methods.getPrices([0,
        "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48","0xdac17f958d2ee523a2206206994597c13d831ec7",
            "0x853d955acef822db058eb8505911ed77f175b99e"]).call();
    console.log("btcPrice :",btcPrice.toString(10));
}

rinkebyQuery();