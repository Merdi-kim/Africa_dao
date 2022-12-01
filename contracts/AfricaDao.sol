// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract AfricaDao {

    struct Proposal {
        string url;
    }

    mapping(uint256 => Proposal) proposals;



    event ProposalCreated();
    event VotedFor();
    event VotedAgainst();
    event ProposalFunded();
    event proposalTimeModified();
    event FundsDistributed();

    function createProposal(string memory _proposalUrl) external {

    }

    function voteForProposal() external {

    }

    function voteAgainstProposal() external {

    }

    function fundProposal() external payable {

    }

    function modifyProposalTime() external {

    }

    function sendProposalFunds() external {

    }


}
