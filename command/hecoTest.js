let Web3 = require("Web3")
const fs = require('fs');
let collateral0 = "0x0000000000000000000000000000000000000000";
let web3 = new Web3(new Web3.providers.HttpProvider("https://http-testnet.hecochain.com"));
let FNXOracle = require("../build/contracts/FNXOracle.json");
let AggregatorV3Interface = require("../build/contracts/AggregatorV3Interface.json");
let ImpliedVolatility = require("../build/contracts/ImpliedVolatility.json");
let daySeconds = 24*3600;
async function HecoTestQuery(){
    let oracle = await new web3.eth.Contract(FNXOracle.abi,"0x122058500a3e223dcc4cdb40451a0f0298fe308a");
    let price = await oracle.methods.getUnderlyingPrice(1).call();
    console.log("BTC Price :",price.toString(10));
    price = await oracle.methods.getUnderlyingPrice(2).call();
    console.log("ETH Price :",price.toString(10));
    price = await oracle.methods.getUnderlyingPrice(3).call();
    console.log("MKR Price :",price.toString(10));
    price = await oracle.methods.getUnderlyingPrice(4).call();
    console.log("SNX Price :",price.toString(10));
    price = await oracle.methods.getUnderlyingPrice(5).call();
    console.log("LINK Price :",price.toString(10));
    price = await oracle.methods.getPrice("0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48").call();
    console.log("USDC Price :",price.toString(10));
    price = await oracle.methods.getPrice("0xbd7e4f0773c6f8cc4e00f619b0500ea1fe4009e6").call();
    console.log("USDT Price :",price.toString(10));
    price = await oracle.methods.getPrice(collateral0).call();
    console.log("ETH Price :",price.toString(10));
    price = await oracle.methods.getPrice("0xeF9Cd7882c067686691B6fF49e650b43AFBBCC6B").call();
    console.log("FNX Price :",price.toString(10));

}
async function calculateIv(volInstance,expiration,curprice,strikePrice){
    let iv = await volInstance.methods.calculateIv(1,0,expiration,curprice,strikePrice).call();
    console.log(iv[0]/iv[1]);
}
HecoTestQuery();