/**
 * Run on truffle console in single line
 *                 OR
 * https://ethereum.stackexchange.com/questions/36549/how-to-run-a-multiline-script-in-truffle-console
 */


//Register Affiliate
Affiliate.deployed().then(function(instance) {
    //TODO : MODIFY THE FOLLOWING ADDRESS ACCORDING TO YOUR SETUP
    var owner = "0x627306090abaB3A6e1400e9345bC60c78a8BEf57";
    var affiliate = "0xf17f52151EbEF6C7334FAD080c5704D77216b732";
    return instance.registerAffiliate(affiliate,"affid_1", {from: owner});
  }).then(function(result) {
    // If this callback is called, the transaction was successfully processed.
    console.log("Transaction successful!");
    console.log(result);
  }).catch(function(e) {
    // There was an error! Handle it.
    console.log("Transaction unsuccessful!");
    console.log(e);
  })
  
//Add Affiliate Order
Affiliate.deployed().then(function(instance) {
    //TODO : MODIFY THE FOLLOWING ADDRESS ACCORDING TO YOUR SETUP
    var owner = "0x627306090abaB3A6e1400e9345bC60c78a8BEf57";
    return instance.addOrder("affid_1", 100, "order_id_1_1", {from: owner});
  }).then(function(result) {
    // If this callback is called, the transaction was successfully processed.
    console.log("Transaction successful!");
    console.log(result);
  }).catch(function(e) {
    // There was an error! Handle it.
    console.log("Transaction unsuccessful!");
    console.log(e);
  })

//Get Affiliate Details
Affiliate.deployed().then(function(instance) {
    //TODO : MODIFY THE FOLLOWING ADDRESS ACCORDING TO YOUR SETUP
    var affiliate = "0xf17f52151EbEF6C7334FAD080c5704D77216b732";
    return instance.getRevenue.call({from: affiliate});
  }).then(function(result) {
    // If this callback is called, the transaction was successfully processed.
    console.log("Transaction successful!");
    console.log(result.toNumber());
  }).catch(function(e) {
    // There was an error! Handle it.
    console.log("Transaction unsuccessful!");
    console.log(e);
  })  
