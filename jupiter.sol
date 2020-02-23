pragma solidity >=0.5.0;

contract Tree {
    function get(uint256 root, uint256[] memory hashes) public pure returns(Account) {}
    function update(address addr, Account account, uint256 root, uint256[] memory hashes) public pure {}
}

contract Jupiter {
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

    // called when a user wants to join Jupiter. The account is funded with the
    // value associated to the calling transaction. Only the hashes and the
    // instruction need to be passed, since the account will be generated.
    function join(bytes hashes, bytes instructions) public payable {
	// Create the contract's input data. This is RLP and consists of one
	// empty RLP list (the account is empty), the list of hashes and the
	// list of instructions.
    	bytes memory data = new bytes(hashes.length + instructions.length + 4);
	data[0] = 0xc0 + hashes.length + instructions.length + 1;
	data[1] = 0xc0 + hashes.length;
	for (int i=0; i<hashes.length; i++) {
		data[i+2] = hashes[i];
	}
	data[2+hashes.length] = 0xc0;
	data[3+hashes.length] = 0xc0 + instructions.length;
	for (int i=0; i<instructions.length; i++) {
		data[i+4+hashes.length] = instructions[i];
	}

	assert(verify());

	// It is now known that the account doesn't already exist, now
	// calculate the new hash and store it.
	uint8 accountsize = 8 /* nonce */ + 32 /* balance */ + 0 /* code */ + 0 /* data */;
    	bytes memory data = new bytes(hashes.length + instructions.length + 3 + accountsize);
	data[0] = 0xc0 + hashes.length + instructions.length + accountsize;
	data[1] = 0xc0 + hashes.length;
	for (int i=0; i<hashes.length; i++) {
		data[i+2] = hashes[i];
	}
	data[2+hashes.length] = 0xc0;
	data[3+hashes.length] = 0xc0 + instructions.length;
	for (int i=0; i<instructions.length; i++) {
		data[i+4+hashes.length] = instructions[i];
	}

	assert(update());
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
