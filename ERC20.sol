// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
 contract Block is IERC20{

  string public name="Resilient"; //name of the token
  string public symbol="RSL"; //symbol of the token
  uint public decimal=0; 
  address public founder;//initially this will have the total supply
  mapping(address=>uint) public balances; //information of balance of each address
  uint public totalSupply;
  mapping(address=>mapping(address=>uint)) allowed;
  
   constructor(){
    totalSupply=100;
    founder=msg.sender;
    balances[founder] = totalSupply;
   }
  ///balance of token of account
  function balanceOf(address account) external view returns (uint256){
     return balances[account];
  }
  function transfer(address recipient, uint256 amount) external returns (bool){
  require(amount>0,"amount must be greater than zero");
  require(balances[msg.sender]>=amount,"Balance must be greater than or equal to amount");
  balances[msg.sender]-=amount;
  balances[recipient]+= amount;
  emit Transfer(msg.sender,recipient,amount);
  return true;
  }
  //owner ne spender ko jitne token ki allowance di ho checking
  function allowance(address owner, address spender) external view returns (uint256){
   return allowed[owner][spender];
  }
//giving
//like signing check
  function approve(address spender, uint256 amount) external returns (bool){
  require(amount>0,"amount must be greater than zero");
  require(balances[msg.sender]>=amount,"Balance must be greater than or equal to amount");
  allowed[msg.sender][spender]=amount;
  emit Approval(msg.sender,spender,amount);
  return true;
  }
 //in order to cash out the check
  function transferFrom(address sender, address recipient, uint256 amount) external returns (bool){
  require(allowed[sender][recipient]>=amount,"You dont have authority to access the token");
  require(balances[sender]>=amount,"Insufficient balance");
  balances[sender]-=amount;
  balances[sender]+=amount;
  emit Transfer(msg.sender,recipient,amount);
  return true;
  }
  
}
//0xA19548d9aFAfc6FCC8d33A5164e683B8165C4eAe
