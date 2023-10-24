// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script, console2} from "forge-std/Script.sol";
import {LrlBtht} from "../src/Token.sol";

contract TokenScript is Script {
    function run() external returns (LrlBtht) {
        vm.startBroadcast();
        LrlBtht lrlbtht = new LrlBtht();
        vm.stopBroadcast();
        return lrlbtht;
    }
}

