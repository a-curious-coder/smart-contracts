pragma solidity >= 0.4.0 < 0.7.0;

contract Voting {

    address private _owner;

    mapping(address => string) internal votes;
    mapping(address => bool) internal registered;

    constructor() public {
        _owner = msg.sender;
    }

    modifier onlyOwner {
        require(
            _owner == msg.sender, "Only the owner"
        );
        _;
    }
    
    modifier isRegisteredToVote(address voter) {
        require(registered[voter], "Must be registered to vote");
        _;
    }

    function setVote(string memory choice) public isRegisteredToVote(msg.sender) {
        votes[msg.sender] = choice;
    }
    
    function getVote() public view returns(string memory) {
        return votes[msg.sender];
    }


    function registerVoter() public  {
        registered[msg.sender] = true;
    }
}