// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "./KIP7/KIP7Mintable.sol";
import "./KIP7/KIP7Burnable.sol";
import "./KIP7/KIP7Pausable.sol";
import "./KIP7/KIP7Metadata.sol";

contract KIP7Token is KIP7Mintable, KIP7Burnable, KIP7Pausable, KIP7Metadata {
    
    uint256 public constant INITIAL_SUPPLY = 1000 * 10**(6 + 18);
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals
    ) KIP7Metadata(name, symbol, decimals) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function approve(address spender, uint256 value)
        public
        override(KIP7Pausable, KIP7, IKIP7)
        returns (bool)
    {
        return super.approve(spender, value);
    }

    function transfer(address to, uint256 value)
        public
        override(KIP7Pausable, KIP7, IKIP7)
        returns (bool)
    {
        return super.transfer(to, value);
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) public override(KIP7Pausable, KIP7, IKIP7) whenNotPaused returns (bool) {
        return super.transferFrom(from, to, value);
    }

    function safeTransfer(
        address recipient,
        uint256 amount,
        bytes memory data
    ) public override(KIP7Pausable, KIP7, IKIP7) whenNotPaused {
        return super.safeTransfer(recipient, amount, data);
    }

    function safeTransferFrom(
        address sender,
        address recipient,
        uint256 amount,
        bytes memory data
    ) public override(KIP7Pausable, KIP7, IKIP7) whenNotPaused {
        return super.safeTransferFrom(sender, recipient, amount, data);
    }
}
