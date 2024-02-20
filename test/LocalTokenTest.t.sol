//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {LocalToken} from "src/LocalToken.sol";
import {Deploy} from "script/Deploy.s.sol";

/**
 * @dev 
 * @notice 
 */
contract LocalTokenTest is Test {
    /* State Variables */
    uint256 public constant SUPPLY = 100 ether;
    uint256 public constant AMOUNT = 10 ether;

    address public steve = makeAddr("steve");
    address public alex = makeAddr("alex");

    LocalToken public localToken;
    Deploy public deploy;

    /* Functions */
    /* External Functions */
    function setUp() public {
        deploy = new Deploy();
        localToken = deploy.run();

        vm.prank(msg.sender);
        localToken.transfer(steve, SUPPLY);
    }

    /* Test Functions */
    function test_stevesBalance() public {
        // Arrange
        uint256 stevesBalance = localToken.balanceOf(steve);
        console.log("steve's balance: ", stevesBalance);

        // Assert
        assertEq(stevesBalance, SUPPLY);
    }

    function test_ifAllowancesWork() public {
        // Arrange
        uint256 Allowance = 10 ether;

        vm.prank(steve);
        localToken.approve(alex, Allowance);

        // Act
        vm.prank(alex); 
        localToken.transferFrom(steve, alex, Allowance);
        
        // Assert
        assertEq(localToken.balanceOf(alex), Allowance);
        assertEq(localToken.balanceOf(steve), SUPPLY - Allowance);
    }

    function test_veryfyTransferWorks() public {
        // Arrange
        vm.prank(steve);
        localToken.transfer(alex, AMOUNT);

        // Act
        uint256 balance = localToken.balanceOf(alex);

        // Assert
        assertEq(balance, AMOUNT);
    }

    function test_verifyBalanceAfterTransferIsUpdated() public {
        // Arrange
        vm.prank(steve);
        localToken.transfer(alex, AMOUNT);

        // Act
        uint256 balance = localToken.balanceOf(steve);

        // Assert
        assertEq(balance, SUPPLY - AMOUNT);
    }
}