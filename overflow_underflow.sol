pragma solidity >= 0.7.0 < 0.9.0;
import "./Safemath.sol";   // this fixes the underflow and overflow problem;
contract underflow{
    using SafeMath for uint256;
    uint256 n =0;

    function add() public returns(uint256){
      n = n.add(1);
      return n;  
    }

    function subtract() public returns(uint256){
        n=n.sub(1);
        return n;
    }
}