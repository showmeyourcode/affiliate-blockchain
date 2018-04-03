pragma solidity ^0.4.17;

contract Affiliate {

    address owner;

    function Affiliate() public {
        owner = msg.sender;
    }

    struct AffiliateData {
        uint256 totalRevenueGenerated;
        uint256 payOutBalanace;
        uint256 paymentPending;
        string lastUpdatedAction;
        string[] orderIds;
    }
    mapping (address=>AffiliateData) AFFILIATE_DATA;
    mapping (string=>address) AFFID_TO_ADDRESS_MAPPING;
    

    /**
     * Registers an affiliate
     */
    function registerAffiliate(address affiliateAddress, string affid) public returns (address) {
        //Register Affiliate
        require(msg.sender == owner);
        AFFILIATE_DATA[affiliateAddress] = AffiliateData(0, 0, 0, "REGISTER", new string[](0));
        AFFID_TO_ADDRESS_MAPPING[affid] = affiliateAddress;
        return msg.sender;
    }

    /**
     * Adds order data for an afiliate
     */
    function addOrder(string affid, uint256 commission, string orderId) public {
        //Only owner of smart contract can add affiliate order
        require(msg.sender == owner);
        AffiliateData storage affiliateData = AFFILIATE_DATA[AFFID_TO_ADDRESS_MAPPING[affid]];
        affiliateData.totalRevenueGenerated += commission;
        affiliateData.payOutBalanace += commission;
        affiliateData.lastUpdatedAction = "ORDER";
        affiliateData.orderIds.push(orderId);
    }

    /**
     * Makes Payment of specified commission
     */
    function makePayment(string affid, uint256 commission) public {
        require(msg.sender == owner);
        AffiliateData storage affiliateData = AFFILIATE_DATA[AFFID_TO_ADDRESS_MAPPING[affid]];
        require(affiliateData.payOutBalanace >= commission);
        affiliateData.payOutBalanace -= commission;
        affiliateData.paymentPending += commission;
        affiliateData.lastUpdatedAction = "STARTED_PAYMENT";
    }

    /**
     * Confirms Payment of specified commission
     */
    function confirmPayment(string affid, uint256 commission) public {
        require(msg.sender == owner);
        AffiliateData storage affiliateData = AFFILIATE_DATA[AFFID_TO_ADDRESS_MAPPING[affid]];
        require(affiliateData.paymentPending >= commission);
        affiliateData.paymentPending -= commission;
        affiliateData.lastUpdatedAction = "COMPLETED_PAYMENT";
    }

        /**
     * Gives out affiliate's data
     */
    function getRevenue() public view returns (uint256) {
        return AFFILIATE_DATA[msg.sender].totalRevenueGenerated;
    }

    function getPayoutBalance() public view returns (uint256) {
        return AFFILIATE_DATA[msg.sender].payOutBalanace;
    }

    function getPaymentPending() public view returns (uint256) {
        return AFFILIATE_DATA[msg.sender].paymentPending;
    }

    function getLastUpdatedAction() public view returns (string) {
        return AFFILIATE_DATA[msg.sender].lastUpdatedAction;
    }
    
    function getTotalOrders() public view returns (uint) {
        return AFFILIATE_DATA[msg.sender].orderIds.length;
    }
    
    function getOrder(uint index) public view returns (string) {
        return AFFILIATE_DATA[msg.sender].orderIds[index];
    }


}