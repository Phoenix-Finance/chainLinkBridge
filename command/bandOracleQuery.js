let Web3 = require("Web3")
const fs = require('fs');
let collateral0 = "0x0000000000000000000000000000000000000000";
let web3 = new Web3(new Web3.providers.HttpProvider("https://demodex.wandevs.org:48545"));
let BandOracle = require("../build/contracts/BandOracle.json");
async function rinkebyQuery(){
    let oracle = await new web3.eth.Contract(BandOracle.abi,"0x412C2a4C1426440Fd277238f70f31792f4E7ef3B");
    let result = await oracle.methods.getPrice("0x764F5244C1e28F7008c82Fd5A1456CbF0bf9c6fa").call();
    console.log("fnx price :",result.toString(10));
    return;
    let btcPrice = await oracle.methods.getUnderlyingPrice(1).call();
    console.log("btcPrice :",btcPrice.toString(10));
    let ethPrice = await oracle.methods.getUnderlyingPrice(2).call();
    console.log("ethPrice :",ethPrice.toString(10));

    result = await oracle.methods.getPrice(collateral0).call();
    console.log("wan price :",result.toString(10));
}

rinkebyQuery();