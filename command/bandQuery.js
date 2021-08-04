let Web3 = require("Web3")
const fs = require('fs');
let collateral0 = "0x0000000000000000000000000000000000000000";
let web3 = new Web3(new Web3.providers.HttpProvider("https://gwan-ssl.wandevs.org:56891"));
let IBandOracleAggregator = require("../build/contracts/IBandOracleAggregator.json");
async function rinkebyQuery(){
    let tx = await web3.eth.getTransaction("0x81b1f2f91bbf7ceaae0238dba35d0df34b8dbaa598f9377c645766b169603748");
    console.log(tx);
    tx = await web3.eth.getTransaction("0x242ca3c86988127e76fd74e63cdf0d4586f2af232f1bbd85822cea6fe17377ba");
    console.log(tx);
    let oracle = await new web3.eth.Contract(IBandOracleAggregator.abi,"0x5eDeB71eD96F716ea769Ca9EAe9552fc112320a3");
    let price = await oracle.methods.getReferenceData(['BTC/USD', 'ETH/USD', 'WAN/USD', 'FNX/USD']).call();
    console.log("BTC Price :",price);
}

rinkebyQuery();