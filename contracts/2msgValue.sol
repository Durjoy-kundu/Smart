// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract demo {
    // msg.value
    // payable  function - contracts become capable of receiving ether
    // payable variables - variables becoems capable of sending and receiving ether
    function addressCaller() public view returns(address){
        return msg.sender;
    }
    function sendEtheToContract() public payable {
        
    }
    function sendEthUser(address payable receiver) public payable {
        receiver.transfer(msg.value);
    }

}
    // sender - contract address - receiver address
    //address of contract -0xDA0bab807633f07f013f94DD0E6A4F96F8742B53