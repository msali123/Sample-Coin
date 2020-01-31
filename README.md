# Sample-Coin
Building some sort of coin issuing contract/system.


# TESTING TO MAKE A COIN DISTRIBUTOR

 ```
 address payable deployer;
 constructor() public{
       deployer = msg.sender;
    }
 ```
 ``deployer``  will always be the address that will invoke this contract.
 
 ```
 modifier onlyOwner(){
    if(msg.sender == deployer){
        _;
    }
    else
    {
        revert("Errorrs");
    } 
    }
 ```
Using a modifier to ensure that only the deployer invoke the function  ``coinDistribution``

``mapping(address => uint) records;`` used to store address as key and coins as value.


```
function coinDistribution(uint _amount, address payable toSend) public payable onlyOwner(){
      records[toSend] += _amount;
  }
function viewBalance() public view  returns(uint,address){
    return (records[msg.sender],deployer);
  }
```

``coinDistribution`` will be taking 2 parameters and storing it them in the mapping,
while the ``viewBalance`` will be returns the amount/coins at the deployers address.



To Run this smart contract please follow following steps

## Installation
1. Install **Ganache** (https://www.trufflesuite.com/ganache)
2. Install **Truffle** ```npm install -g truffle```
3. Start Test Network 
   - Use ganache gui
       - This will create Test network

# Compile, Deploy and Test Project
1. Inside that folder Compile with following command
   - ```truffle.cmd compile``` on Windows


2. Deploy Contract with following command
   - ```truffle.cmd migrate```  on Windows
   
2. Test Contract with following command
   - ```truffle.cmd test```  on Windows


## Important
Check your host and port, make sure to replace it in ```truffle-config.js```

