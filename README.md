# Building-a-Decentralized-Lending-Dapp-with-Solidity
Building a simple Decentralized Lending  Dapp with Solidity to deploy on any EVM network



1) Create a simple ERC-20 token that acts as the lending pool’s currency.

2) Write the lending pool contract where users can:
   
* Deposit tokens to earn interest.
* Borrow tokens against their deposits.
* Withdraw tokens plus any interest accrued.

3) Deploy the contracts on a local testnet, interact via a simple frontend, and see how deposits and withdrawals work.

# Step 1: ERC-20 Token Contract
We need an ERC-20 token to serve as the lending pool’s base currency. This token will be minted and distributed to simulate real-world deposits.

# Step 2: Lending Pool Contract
Next, we create a lending pool contract. This contract lets users deposit and withdraw tokens and tracks the total amount deposited. It also calculates a simple interest rate over time.

# Step 3: Deployment and Frontend Integration

1) Deploy the contracts:

* First deploy the LendingToken contract and note its address.
* Then deploy the LendingPool contract, passing the LendingToken address to its constructor.

2) Frontend integration:

* Use a simple React app to connect a wallet (e.g., MetaMask).
* Add a “Deposit” button that calls deposit(amount) on the lending pool contract.
* Add a “Withdraw” button that calls withdraw() on the lending pool contract.
* Display the user’s current balance and the accrued interest.
