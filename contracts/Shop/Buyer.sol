// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IShop {
    function isSold() external returns(bool);
    function buy() external;
}

contract Buyer {
    address public shop;

    constructor(address _shop) {
        shop = _shop;
    }

    function price() external returns (uint256) {
        if(!IShop(shop).isSold()) {
            return 100;
        } else {
            return 0;
        }
    }

    function buyFromShop() external {
        IShop(shop).buy();
    }
}