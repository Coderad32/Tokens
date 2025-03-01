pragma solidity ^0.8.0;

contract Token {
    // Mapping of addresses to balances
    mapping (address => uint256) public balances;

    // Total supply of tokens
    uint256 public totalSupply;

    // Token name
    string public name;

    // Token symbol
    string public symbol;

    // Token decimals
    uint8 public decimals;

    // Event emitted when a new token is minted
    event Mint(address indexed to, uint256 amount);

    // Event emitted when a token is transferred
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // Event emitted when a token is burned
    event Burn(address indexed from, uint256 amount);

    // Constructor function
    constructor(string memory _name, string memory _symbol, uint8 _decimals) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = 0;
    }

    // Function to mint new tokens
    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        balances[to] += amount;
        totalSupply += amount;
        emit Mint(to, amount);
    }

    // Function to transfer tokens
    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    // Function to burn tokens
    function burn(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        totalSupply -= amount;
        emit Burn(msg.sender, amount);
    }

    // Function to get the balance of a specific address
    function getBalance(address addr) public view returns (uint256) {
        return balances[addr];
    }

    // Function to get the total supply of tokens
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    // Owner of the contract
    address public owner;

    // Set the owner of the contract
    constructor() public {
        owner = msg.sender;
    }
}
