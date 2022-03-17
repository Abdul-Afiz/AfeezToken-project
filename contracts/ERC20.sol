//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20{

   uint public cost = 1 ether;

   constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
   _mint(msg.sender, 1000000 * (10 ** 18));
   totalSupply();
 }

 function buyToken(address receiver)public payable {
   require(msg.value == cost);
  _mint(receiver, 1000 * (10 ** 18));
 }

}