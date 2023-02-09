// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Ownable.sol";
import "./TimeLock.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";

contract AGGToken is ERC20Pausable, Ownable, TimeLock {
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initSupply
    ) public ERC20(_name, _symbol) {
        uint256 initSupply = _initSupply * (10**uint256(_decimals));
        mint(initSupply);
    }

    function mint(uint256 _amount) public onlyOwner returns (bool) {
        _mint(msg.sender, _amount);
        return true;
    }

    function burn(uint256 _amount) public onlyOwner {
        _burn(msg.sender, _amount);
    }

    function pause() public virtual onlyOwner {
        _pause();
    }

    function unpause() public virtual onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(
        address _from,
        address _to,
        uint256 _amount
    ) internal virtual override(ERC20Pausable) whenNotPaused notLocked {
        super._beforeTokenTransfer(_from, _to, _amount);
    }
}
