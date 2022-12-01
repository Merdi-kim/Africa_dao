// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract AfricaDao {

    struct Proposal {
        string url;
        address payable proposalOwner;
        uint256 votesFor;
        uint256 votesAgainst;
        uint256 fundsRaised;
    }

    mapping(address => Proposal) proposals;

    event ProposalCreated();
    event VotedFor();
    event VotedAgainst();
    event ProposalFunded();
    event proposalTimeModified();
    event FundsDistributed();

    function createProposal(string memory _proposalUrl) external {
        //require(condition);   @condition to make sure the same proposal link is not submitted twice 
        proposals[msg.sender] = Proposal(_proposalUrl, payable(msg.sender), 0, 0, 0);
        emit ProposalCreated();
    }

    function voteForProposal(address _proposalId) external {
        Proposal memory thisProposal = proposals[_proposalId];
        thisProposal.votesFor = thisProposal.votesFor + 1;
        emit VotedFor();
    }

    function voteAgainstProposal(address _proposalId) external {
        Proposal memory thisProposal = proposals[_proposalId];
        thisProposal.votesAgainst = thisProposal.votesAgainst + 1;
        emit VotedAgainst();
    }

    function fundProposal( address _proposalId) external payable {
        require(msg.value !=0, 'Enter non empty amount');
        Proposal memory thisProposal = proposals[_proposalId];
        thisProposal.fundsRaised = thisProposal.fundsRaised + msg.value;
        payable(address(this)).transfer(msg.value);
        emit ProposalFunded();
    }

    function modifyProposalTime() external {

    }

    function sendProposalFunds(address _proposalId) external {
        Proposal memory thisProposal = proposals[_proposalId];
        thisProposal.proposalOwner.transfer(thisProposal.fundsRaised);
        emit FundsDistributed();
    }


}
