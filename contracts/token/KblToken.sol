// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "./ILocker.sol";

contract KblToken is Ownable, ERC20Burnable, ILockerUser {
    uint256 constant CAP = 14000000000 * 10 ** 18;
    ILocker public override locker;
    constructor () ERC20("Karbala Token", "KBL") {
        _mint(msg.sender, CAP);
    }

    function setLocker(address _locker)
    external onlyOwner() {
        locker = ILocker(_locker);
        ILocker(_locker).lockOrGetPenalty(msg.sender, address(this)); //verify can be called
    }

    function _transfer(address sender, address recipient, uint256 amount)
    internal virtual override {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(amount < 2 ** 127, "ERC20: amount too large");
        if (address(locker) != address(0)) {
          locker.lockOrGetPenalty(sender, recipient);
        }
        return ERC20._transfer(sender, recipient, amount);
    }
}
