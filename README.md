## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

#### 1) Create New Project: 
  forge init hello_foundry

#### 2) Link with github: 
    a) Create a repository on github
    b) git remote add origin <REMOTE_URL>
       git remote -v
    c) git push -u origin main
    d) If error look chatGPT (git config user.name "name")
#### 1) Bis) Quickstart:
	- git clone URL
	- cd NEW_FOLDER
	- forge build

#### 3) Dependencies:
	- forge install openzeppelin/openzeppelin-contracts

#### 4) Deploy on a Devnet:
	a) In an other terminal run: anvil
	c) Create a Script
	b) forge script script/Token.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac097...

#### 4) Bis) Create .env file:
	a) Create the file
	b) Add it to the .gitignore
	c) Add to the terminal the variables : source .env
	d) forge script script/Token.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY

#### 5) Interact with the Devnet:
	a) Recup the Contract Address: 0xe7f17...
	b) Interact with function : cast send 0xe7f17... "addToAllowList(address)" "<Public Key>" --rpc-url $RPC_URL --private-key $PRIVATE_KEY
	c) Read Function: cast call 0xe7f17... "isUserAllowed(address)(bool)" <Public Key>
	d) Remark:
		- Convert Hex to decimal: cast --to-base 0x15b7d6 dec

#### 6) Deploy on Testnet:
	a) Add to the .env: 
		SEPOLIA_RPC_URL=https://sepolia.infura.io/v3/...
		SEPOLIA_PRIVATE_KEY=c5d83... (Metamask private key)
	b) forge script script/Token.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY --broadcast
	c) Recup the hash of the transaction and put it on sepolia.etherscan: https://sepolia.etherscan.io/tx/0xbe6...
	c) Bis) If you want to automaticly verify your contract:
		- Create an Etherscan api key on etherscan site: ETHERSCAN_API_KEY=...
		- forge script script/Token.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY



 
