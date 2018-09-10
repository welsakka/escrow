pragma solidity ^0.4.19;

contract EscrowContract {
	address public arbiter;
	address public beneficiary;
	address public depositor;
	
	event Approved(uint _value);

	constructor(address _arbiter, address _beneficiary) public payable{
		arbiter = _arbiter;
		beneficiary = _beneficiary;
		depositor = msg.sender;
	}

	function approve() public {
	    emit Approved(address(this).balance);
		require (msg.sender == arbiter);
		if (depositor.balance >= address(this).balance){
			beneficiary.transfer(address(this).balance);
		}
	}
}