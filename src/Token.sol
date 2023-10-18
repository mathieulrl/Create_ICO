// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LrlBtht is ERC20, Ownable {
    uint256 public totalSupply;

    constructor() ERC20("LrlBtht Token", "LRBT") {
        totalSupply = 1000000 * 10 ** uint256(decimals());
        _mint(msg.sender, totalSupply);
    }

    // Function to mint additional tokens (only callable by the owner)
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens (only callable by the owner)
    function burn(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }

    // Optional: Add other custom functions or modifiers as needed

    // This function allows users to exchange 1 ETH for 1 LRBT token
    function getToken() external payable {
        require(msg.value == 1 ether, "You must send exactly 1 ETH to exchange for 1 LRBT token");
        
        // Calculate the number of tokens to mint based on the exchange rate
        uint256 tokensToMint = 1 * 10 ** uint256(decimals());

        // Mint the tokens and transfer them to the sender
        _mint(msg.sender, tokensToMint);
    }


}