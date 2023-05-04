// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DestructContract {
    address public forceContract;

    constructor(address _forceContract) {
      forceContract = _forceContract;
    }

    function destructer() public {
      selfdestruct(payable(forceContract));
    }

    receive() external payable {}

    fallback() external payable {}
}