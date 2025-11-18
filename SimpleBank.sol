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
      //Depositar y actualizar balance
      balances[msg.sender] += msg.value;
      emit Deposit(msg.sender, msg.value);
  }

  //Retirar amount
  function withdraw(uint amount) external nonReentrant{
    require(balances[msg.sender] >= amount, "No Funds left to withdraw");
    balances[msg.sender] -= amount;
    // Forma más segura y flexible para enviar ETH hoy en día
    (bool sent, ) = msg.sender.call{value: amount}("");
    require(sent, "Failed to send ether");
    emit Withdraw(msg.sender, amount);
  }

  //Ver saldo
  function balance() external view returns(uint){
      //Revisa el balance
      //Lo devuelve, este deberia ser el mas facil
      return balances[msg.sender];
  }
}
