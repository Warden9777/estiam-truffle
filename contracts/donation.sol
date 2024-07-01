// contracts/Donation.sol
pragma solidity ^0.8.0;

contract Donation {
    struct DonationStruct {
        uint id;
        address donateur;
        uint montant;
        uint timestamp;
    }

    DonationStruct[] public donations;
    mapping (address => uint[]) public donateurToDonations;

    function createDonation(uint _montant) public {
        DonationStruct memory newDonation = DonationStruct(
            donations.length,
            msg.sender,
            _montant,
            block.timestamp
        );
        donations.push(newDonation);
        donateurToDonations[msg.sender].push(newDonation.id);
    }

    function getDonations() public view returns (DonationStruct[] memory) {
        return donations;
    }

    function getDonateurDonations(address _donateur) public view returns (uint[] memory) {
        return donateurToDonations[_donateur];
    }
}