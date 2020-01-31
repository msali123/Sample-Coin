pragma solidity 0.5.11;
contract myCoin{
    
    address payable deployer;
    constructor() public{
       deployer = msg.sender;
    }
    mapping(address => uint) records;
     modifier onlyOwner(){
        if(msg.sender == deployer){
            _;
        }
        else
        {
            revert("Errorrs");
        }
    }
    function coinDistribution(uint _amount, address payable toSend) public payable onlyOwner(){
        records[toSend] += _amount;
    }
    function viewBalance() public view  returns(uint,address){
        return (records[msg.sender],deployer);
    }
}