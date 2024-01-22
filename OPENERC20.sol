//this is contract using openzeppelin for ERC20 token
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract OPENERC20 is ERC20{
    constructor(uint256 initialSupply) ERC20("Resilient", "RSL")  {
        _mint(msg.sender,initialSupply);
    }
}