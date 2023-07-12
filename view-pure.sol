pragma solidity >= 0.7.0 < 0.10.0;

contract Gastest{
    function testExternal(uint[2] calldata numbers) external pure returns (uint){
       return numbers[0];
    }

    function testPublic(uint[10] memory numbers) public pure returns (uint){
       return numbers[0];
    }
}