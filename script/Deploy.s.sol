//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {LocalToken} from "src/LocalToken.sol";

/** 
 * @dev this is the deploy script created to deploy our contract
 * @notice there is no network config required in this
 */
contract Deploy is Script {
    /* State Variables */
    uint256 private constant SUPPLY = 1000 ether;

    /* Functions */
    /* External Functions */
    function run() external returns (LocalToken localToken) {
        /* Before Broadcast */
        /* Broadcast */
        vm.startBroadcast();
        localToken = new LocalToken(SUPPLY);
        vm.stopBroadcast();
        /* After Broadcast */
    }
}
