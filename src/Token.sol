// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";


contract LrlBtht is ERC20, Ownable {
    mapping(address => bool) public allowedUsers;

    enum Tier {One, Two, Three}
    mapping(address => Tier) public userTiers;

    constructor() ERC20("LrlBtht Token", "LRBT") Ownable(msg.sender) {
        _mint(msg.sender, 1000000 * 10 ** uint256(decimals()));
    }

    function addToAllowList(address user) public onlyOwner {
        allowedUsers[user] = true;
    }
    
    modifier onlyAllowed() {
        require(allowedUsers[msg.sender], "You are not allowed to call this function.");
        _;
    }

    function setTier(address user, Tier tier) public onlyOwner {
        userTiers[user] = tier;
    }

    function getToken() external payable onlyAllowed {
        require(msg.value > 0, "You must send some ETH to exchange for LRBT tokens");

        uint256 tokensToMint;
        Tier userTier = userTiers[msg.sender];
        if (userTier == Tier.One) {
            tokensToMint = msg.value * 1 * 10 ** uint256(decimals());
        } else if (userTier == Tier.Two) {
            tokensToMint = msg.value * 2 * 10 ** uint256(decimals());
        } else if (userTier == Tier.Three) {
            tokensToMint = msg.value * 3 * 10 ** uint256(decimals());
        } else {
            revert("You are not allowed to call this function.");
        }

        _mint(msg.sender, tokensToMint);
    }

    function airdropTokens(address[] calldata recipients, uint256[] calldata amounts) public onlyOwner {
        require(recipients.length == amounts.length, "Arrays must have the same length");
        
        for (uint256 i = 0; i < recipients.length; i++) {
            address recipient = recipients[i];
            uint256 amount = amounts[i];

            require(recipient != address(0), "Invalid recipient address");
            require(amount > 0, "Amount must be greater than 0");

            // Mint and transfer tokens to the recipient
            _mint(recipient, amount);
        }
    }

}