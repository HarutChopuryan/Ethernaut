// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function goTo(uint256) external;
}

contract Building {
    address public elevatorAddress;
    bool public lastFloorIndicator;

    constructor(address _elevatorAddress) {
        elevatorAddress = _elevatorAddress;
    }
    
    function goToFloor(uint256 _floor) external {
        IElevator(elevatorAddress).goTo(_floor);
    }
    
    function isLastFloor(uint256) public returns (bool) {
      if (!lastFloorIndicator) {
        lastFloorIndicator = true;
        return false;
      } else {
        lastFloorIndicator = false;
        return true;
      }
    }
}