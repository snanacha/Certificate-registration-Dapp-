pragma solidity >=0.4.0 < 0.6.0;

//create contract 

contract certificate {
    string public name;
    uint public level;
    address owner;
    
    constructor()public{
        owner=msg.sender;
    }
    event Hashcertifi(
        string name,
        uint level);
    modifier checkLevel(uint _level){
        require(
            _level<=3,
            "You have entered the wrong level."
            );
            _;
    }
    modifier onlyOwner{
        require(
            msg.sender ==owner,
            "You must be the owner"
            );
            _;
    }
    //<0.5 version ---no memory keyword
    function setCertificate(string memory _name, uint _level) checkLevel(_level) onlyOwner public
    {
        name=_name;
        level=_level;
        emit Hashcertifi(_name,_level);
    }
    function getCertificate()public view returns (string memory, uint){
        return(name,level);
    }
}

