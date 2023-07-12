// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//CHECKS, EFFECT, INTERACTIONS -patterns  to prevent re-entrancy attack
contract test{//unsafe
    mapping (address => uint) balance;

  /*  function withdraw()public{
        require(balance[msg.sender]>0);//checkd
        msg.sender.send(balance[msg.sender]); //interaction
        balance[msg.sender]=0; //effect
    }*/

  //right solution

   function withdraw()public{
        require(balance[msg.sender]>0); //checks
        uint toTransfer = balance[msg.sender];
        balance[msg.sender]=0; //effects
       (bool success,)= msg.sender.call{value: toTransfer}(""); //Interaction  best way to send
        if(!success){
            balance[msg.sender]=toTransfer;
        }
    }
}