// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// This special spec allows us to take a snapshot of the voting power (i.e. voting-compatible ERC 20 token)
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract GovernanceToken is ERC20Votes {
    // Maximum supply of the governance token in circulation (1M tokens, up to 18 decimal places)
	uint256 public s_maxSupply = 1000000000000000000000000;

    // Instantiate the ERC20 spec
	constructor()
		ERC20("GovernanceToken", "GT")
		ERC20Permit("GovernanceToken")
	{
		_mint(msg.sender, s_maxSupply); // Give the owner all the tokens
	}

	// The functions below are overrides required by Solidity.


    // Here, we create a function that then passes these arguments into the parent class
    // (where there are other functions that transfers the voting power)
	function _afterTokenTransfer(
		address from,
		address to,
		uint256 amount
	) internal override(ERC20Votes) {
		super._afterTokenTransfer(from, to, amount);
	}

	function _mint(address to, uint256 amount) internal override(ERC20Votes) {
		super._mint(to, amount);
	}

	function _burn(address account, uint256 amount)
		internal
		override(ERC20Votes)
	{
		super._burn(account, amount);
	}
}

