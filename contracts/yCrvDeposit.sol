pragma solidity =0.5.16;
import './interfaces/ICrvDeposit.sol';
import './interfaces/IERC20.sol';
import './libraries/SafeMath.sol';

contract yCrvDeposit {
    using SafeMath for uint;
    address constant public crv_deposit = address(0xFA712EE4788C042e2B7BB55E6cb8ec569C4530c1);
    address constant public yCrv_address = address(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);
    IERC20 constant public yCrv = IERC20(yCrv_address);

    function deposit(uint256 _amount) internal {
        ICrvDeposit(crv_deposit).deposit(_amount);
    }
    function withdraw(uint256 _amount) internal {
        ICrvDeposit(crv_deposit).withdraw(_amount);
    }
    function yBalanceOf(address _address) internal view returns (uint256) {
        return ICrvDeposit(crv_deposit).balanceOf(_address);
    }
    function rebalance(uint16 ratio) external {
        require(ratio <= 1000, "ratio too large");
        uint a = yCrv.balanceOf(address(this));
        uint b = ICrvDeposit(crv_deposit).balanceOf(address(this));
        uint t = a.add(b);
        t = t.mul(ratio).div(1000);
        if (t > b) deposit(t-b);
        else withdraw(b-t);
    }
}
