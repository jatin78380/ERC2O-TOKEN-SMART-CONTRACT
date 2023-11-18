//this is openzepplin code
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract GLDToken is ERC20{
    constructor(uint256 initialSupply) ERC20("Resilient", "RSL")  {
        _mint(msg.sender,initialSupply);
    }
}