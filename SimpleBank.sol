//SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract SimpleBank {

  mapping(address => uint) public balances;


  //Deposit
  function deposit() external payable{
      require(msg.value > 0, "Amount should be greater than 0");
      //Depositar y actualizar balance
      balances[msg.sender] += msg.value;
  }

  //Retirar amount
  function withdraw(uint amount) external{
    require(balances[msg.sender] >= amount, "No Funds left to withdraw");
    balances[msg.sender] -= amount;
    // Forma correcta de mandar eth hoy en dia
    (bool sent, ) = msg.sender.call{value: amount}("");
    require(sent, "Failed to send ether");
  }

  //Ver saldo
  function balance() external view returns(uint){
      //Revisa el balance
      //Lo devuelve, este deberia ser el mas facil
      return balances[msg.sender];
  }
}
