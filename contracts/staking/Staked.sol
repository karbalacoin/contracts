// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 */
interface Staked {
    
    event Staked(address indexed token, address indexed staker_, uint256 requestedAmount_, uint256 stakedAmount_);

    function stake (uint256 amount) external returns (bool);

    function stakeFor (address staker, uint256 amount) external returns (bool);

    function stakeOf(address account) external view returns (uint256);

    function tokenAddress() external view returns (address);

    function stakedTotal() external view returns (uint256);

    function stakedBalance() external view returns (uint256);

    function stakingStarts() external view returns (uint256);

    function stakingEnds() external view returns (uint256);
}
