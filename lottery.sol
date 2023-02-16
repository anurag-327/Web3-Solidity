// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract lottery{
    address public manager;
    address payable[] public players;
    constructor()
    {
        manager=msg.sender;
    }

    // checking if already registered
    function alreadyentered() view private returns(bool)
    {
         for(uint i=0;i<players.length;i++)
         {
             if(players[i]==msg.sender)
             return true;
         }
         return false;
    }
    // adding sender to players list
    function enter() payable public
    {
       require(msg.sender !=manager,"manager is not allowed to enter");
       require(alreadyentered()==false,"you have already registered");
       require(msg.value >=1 ether, "In sufficient Ether payed");
       players.push(payable(msg.sender)); 
    }
    // generating random index
    function generaterandom() view private returns(uint)
    {
        return uint(sha256(abi.encodePacked(block.difficulty,block.number,players)));
    }
     // transfering and resetting players
    function pickwinner() payable public
    {
        require(msg.sender == manager,"only manager can pick winner");
        uint index=generaterandom()%players.length;
        address contractaddress= address(this);
        players[index].transfer(contractaddress.balance);
        players=new address payable[](0);
    }
    // getting list of all players
    function getplayers() view public returns(address payable[] memory)
    {
        return players;
    }
}
