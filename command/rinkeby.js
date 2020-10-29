let Web3 = require("Web3")
const fs = require('fs');
let collateral0 = "0x0000000000000000000000000000000000000000";
let web3 = new Web3(new Web3.providers.HttpProvider("https://rinkeby.infura.io/v3/f977681c79004fad87aa00da8f003597"));
let FNXOracle = require("../build/contracts/FNXOracle.json");
let ImpliedVolatility = require("../build/contracts/ImpliedVolatility.json");
let daySeconds = 24*3600;
async function rinkebyQuery(){
    let oracle = await new web3.eth.Contract(FNXOracle.abi,"0xAFd44Ac5Ac276869B24Fdbc604f1fBbB67F37009");
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
    price = await oracle.methods.getPrice("0xD12BC93Ac5eA2b4Ba99e0ffEd053a53B6d18C7a3").call();
    console.log("USDC Price :",price.toString(10));
    price = await oracle.methods.getPrice(collateral0).call();
    console.log("ETH Price :",price.toString(10));
    price = await oracle.methods.getPrice("0xaf30F6A6B09728a4e793ED6d9D0A7CcBa192c229").call();
    console.log("FNX Price :",price.toString(10));

}
async function calculateIv(volInstance,expiration,curprice,strikePrice){
    let iv = await volInstance.methods.calculateIv(1,0,expiration,curprice,strikePrice).call();
    console.log(iv[0]/iv[1]);
}
rinkebyQuery();