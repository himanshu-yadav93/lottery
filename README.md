🏆 Decentralized Lottery Smart Contract

This project implements a transparent, automated lottery system on the Ethereum blockchain. It ensures that the manager cannot cheat, and the winner selection process is handled via code logic.📝 Key Features
Manager Role: A dedicated administrator who can check the balance and trigger the winner selection.Ether Requirement: Each participant must contribute exactly 1 Ether to enter.
Automated Payout: The entire prize pool is automatically transferred to the winner's wallet.
Security: Prevents non-managers from picking winners or viewing the contract balance.

⚙️ Code Components Explained

1. State Variables
# manager: Stores the address of the person who deployed the contract.
# players: A dynamic array of address payable to keep track of all participants.
# winner: Stores the address of the last successful lottery winner.

🛠 Technical Implementation Details

# Winner Selection Logic
The contract uses the following formula to pick a winner index: index = randomNumber\players.length
# Reset Mechanism
After a winner is picked and the funds are transferred, the line players = new address payable[](0); clears the array. This allows the contract to be reused for a new round of the lottery without redeploying.
# Security Requirements
The contract uses require statements to enforce rules:require(msg.value == 1 ether): Ensures a standard entry fee.require(players.length >= 3): Ensures a minimum level of competition before a winner can be drawn.require(manager == msg.sender): Protects administrative functions from unauthorized access.

⚠️ Note on Randomness: This contract uses block.number for randomness, which is sufficient for learning and small-scale testing. However, for high-stakes production environments, it is recommended to use Chainlink VRF to prevent miner manipulation.

🚀 How to UseDeploy: The account used to deploy becomes the Manager.Enter: Participants call the participants() function and send 1 Ether.Draw: Once 3 or more players have joined, the Manager calls pickWinner().Payout: The contract automatically clears its balance and sends it to the winner.
