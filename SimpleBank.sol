//SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract SimpleBank {

  //Manual reentrancy guard without open zeppelin
  bool internal locked;
  modifier nonReentrant(){
    require(!locked, "Reentrancy blocked");
    locked = true;
    _;
    locked = false;
  }

  mapping(address => uint) public balances;

  event Deposit(address indexed account, uint amount);
  event Withdraw(address indexed account, uint amount);

  //Deposit
  function deposit() external payable{
      require(msg.value > 0, "Amount should be greater than 0");
      //Deposit and then update balance
      balances[msg.sender] += msg.value;
      emit Deposit(msg.sender, msg.value);
  }

  //Withdraw an amount
  function withdraw(uint amount) external nonReentrant{
    require(balances[msg.sender] >= amount, "No Funds left to withdraw");
    balances[msg.sender] -= amount;
    // Best practice for security that's also flexible to send ETH nowadays
    // Reentrancy guard done manually
    (bool sent, ) = msg.sender.call{value: amount}("");
    require(sent, "Failed to send ether");
    emit Withdraw(msg.sender, amount);
  }

  //Check Balance
  function balance() external view returns(uint){
      //Just a return of the balance using msg.sender to grab the value
      return balances[msg.sender];
  }
}
