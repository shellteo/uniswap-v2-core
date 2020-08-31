pragma solidity >=0.5.0;

interface ICrvDeposit {
    function deposit(uint256) external;
    function withdraw(uint256) external;
    function balanceOf(address) external view returns (uint256);
}