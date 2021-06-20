pragma solidity >= 0.4.0 < 0.7.0;

contract Greeter {

	// State variable
	string private _greeting = "Hello, World!";
	address private _owner;

	// Only called once during contract deployment.
	constructor() public   {
			_owner = msg.sender;
	}

		// A check that can be used to validate the owner is changing the _greeting value
	modifier onlyOwner() {
			require(
					msg.sender == _owner,
					"Only the owner can update the greeting"
			);
			_;
	}
	
	function greet() external view returns(string memory)   {
			return _greeting;
	}

	function setGreeting(string calldata greeting) external onlyOwner{
			_greeting = greeting;
	}
	
	function owner() public view returns(address)   {
			return _owner;
	}
}