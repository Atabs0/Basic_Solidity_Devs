// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract gastest{

    struct Entity{
    uint data;
    address _address;
    }

    mapping (address => Entity) public entity;
    Entity [] entityA;
    function addEntitym(address addr, uint data) public returns(bool success){
        
            entity[addr].data = data;
            entity[addr]._address =msg.sender;
            return true;
        
    }

    function updateEntirym() public returns(bool success){
        entity[msg.sender].data= 3;
        return true;
    }

     function addEntityA(address addr, uint data) public returns(bool success){
        Entity memory entity1;
            entity1.data = data;
            entity1._address =msg.sender;
            return true;
        
    }

    function updateEntiryA() public returns(bool success){
        entity[msg.sender].data= 3;
        return true;
    }
}