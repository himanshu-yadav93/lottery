// SPDX-License-Identifier: MIT
pragma solidity  >=0.5.0 < 0.9.0;

contract lottery {
    
    // first we create manager,players and winner

    address public manager;
    address payable[] public players;
    address payable public winner;

   // now we declare our constructor

   constructor() {
    manager=msg.sender;
   }
    
    // now we add requirements for players
 
    function participants() public payable {
       require(msg.value==1 ether,"please pay 1 ether");
        players.push(payable(msg.sender));
    }

    // function to check balance

    function getBalance() public view returns (uint) {
        require(manager==msg.sender,"you are not the owner");
        return address(this).balance;
    }

    //now we create random no. to choose winner

     function randomNumber() private    view returns (uint) {
        return uint(sha256(abi.encodePacked(block.number)));}
    
    //function to check winner

    function pickWinner() public   {
        require(msg.sender==manager,"you are not the owner");
        require(players.length>=3, "not sufficient players to withdraw lottery");
       
        uint256 reminder=randomNumber()%players.length;
        winner=players[reminder];
        winner.transfer(getBalance());
        players=new address payable[](0);
    }
    // function to get the address of all players participating
    
    function allPlayers() public view returns(address payable [] memory ){
        return players;
    }
}