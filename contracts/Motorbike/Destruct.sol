// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Destruct {
    function destroy() external {
        address payable addr = payable(0x09642E5eef9d14E5C9E14610D2097d6DcCCfDA59);
        selfdestruct(addr);
    }
}