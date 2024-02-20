//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title LocalToken
 * @author note-xin
 * @notice this contract is a section of cyfrin-foundry-course-f23
 * @dev this contract implements  ERC 20 token standards 
 */
contract LocalToken is ERC20{
    /* State Variables */
    string private constant name_ = "LocalToken";
    string private constant symbol_ = "LT";

    /* Events */

    /* Functions */
    /* Constructor */
    constructor (uint256 _supply) ERC20 (name_, symbol_){
        _mint(msg.sender, _supply);
    }

    /* Public Functions */
}
