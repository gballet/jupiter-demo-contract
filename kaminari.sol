pragma solidity >=0.5.0;

contract Tree {
    function get(uint256 root, uint256[] memory hashes) public pure returns(Account) {}
    function update(address addr, Account account, uint256 root, uint256[] memory hashes) public pure {}
}

contract Kaminari {
    uint256 root;
    
    bytes constant contract_code = 0x0;
    
    struct Transaction {
        uint256 from;
        uint256 to;
        bool close;
        bool refund;
        uint256 value;
        uint256 signature;
        uint nonce;
    }
    
    struct Instruction {
        bytes1 instruction;
        uint256 target;
    }
    
    struct Account {
        uint256 balance;
        bool closed;
        uint nonce;
    }
    
    constructor() public {
        // Set the empty hash
        root = 0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421;
    }
    
    // fund_address will fund the address of the sender with the value
    function fund_address(uint256[] memory hashes, uint256 balance) public payable {
    }

    function create_channel(uint256 other, uint256[] memory hashes, uint256[] memory hashes_contract, uint256 funds) public {
    }

    // process_tx will execute the instructions
    function process_tx(Transaction[] memory txs, uint256[] memory hashes_contract, address contract_address) public {
    }

    function get_root() public view returns(uint256) {
        return root;
    }
}
