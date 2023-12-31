pragma solidity >= 0.8.0  < 0.10.0;
pragma abicoder v2;
import "./Ownable.sol";

interface GovermentInterface{
    function addTransaction(address _from, address _to, uint _amount) external payable;
}

contract Bank is Ownable {

    /*
    struct balance{
        address adrr;
        uint value;
    }

    balance [] balances;
    */
    
    GovermentInterface govermentInstance = GovermentInterface(0x3328358128832A260C76A4141e19E2A943CD4B6D);
    
    mapping(address => uint) balance;
    
    event depositDone(uint amount, address indexed depositedTo);
    
    
    function deposit() public payable returns (uint)  {
        balance[msg.sender] = msg.value;
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }
    
    function withdraw(uint amount) public onlyOwner returns (uint){
        require(balance[msg.sender] >= amount);
        msg.sender.transfer(amount);
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Don't transfer money to yourself");
        
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
        
        //govermentInstance.addTransaction(msg.sender, recipient, amount);
        
        assert(balance[msg.sender] == previousSenderBalance - amount);
    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] - amount;
        balance[to] + amount;
    }
      function getTransfers() external view returns(uint[] memory) {

    }
    
}