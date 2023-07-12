pragma solidity >= 0.7.0 < 0.9.0;


contract Ownable{
    address ownner;
    modifier onlyOwner(){
        require(msg.sender == ownner);
        _;
    }
}