# Raffle Contract
================

A Chainlink VRF-powered raffle contract that implements secure random winner selection using Chainlink's Verifiable Random Function (VRF).

## Overview
--------

This contract creates a decentralized raffle system where users can participate by paying an entry fee. The winner is selected using Chainlink VRF for provably fair randomness, and the entire process is automated using Chainlink Keepers.

## Features
--------

*   Secure random winner selection using Chainlink VRF
*   Automated execution using Chainlink Keepers
*   Entry fee-based participation
*   Configurable raffle intervals
*   Event emissions for transparency
*   Comprehensive error handling

## Contract Details
----------------

### State Variables

*   `REQUEST_CONFIRMATIONS`: 3 blocks for additional security
*   `NUM_WORDS`: 1 random word for winner selection
*   `i_entryFee`: Cost to participate in raffle
*   `i_interval`: Time between raffles
*   `i_keyHash`: Chainlink VRF gas lane
*   `i_subscriptionId`: Chainlink VRF subscription ID
*   `i_callbackGasLimit`: Gas limit for VRF callback
*   `s_players`: Array of participants
*   `s_lastTimeStamp`: Last raffle timestamp
*   `s_lastWinner`: Previous winner
*   `s_raffleState`: Current raffle state (OPEN/CALCULATING)

### Events

*   `RaffleJoined`: Emitted when a player joins
*   `WinnerChosen`: Emitted when a winner is selected

## Usage
-----

### Deployment

To deploy the contract, you'll need:

1.  Chainlink VRF subscription ID
2.  VRF coordinator address
3.  Gas lane key hash
4.  Entry fee amount
5.  Raffle interval
6.  Callback gas limit


```

### Participation

Users can join the raffle by calling `joinRaffle()` with the required entry fee:

```

### Automation

The contract uses Chainlink Keepers for automation. The `checkUpkeep` function determines when a new raffle should be triggered:
```solidity

```

## Security Considerations
----------------------

1.  **Randomness**: Uses Chainlink VRF for provably fair random number generation
2.  **Reentrancy**: Protected by state management and event emissions
3.  **ETH Transfer**: Uses checked transfers with error handling
4.  **Access Control**: Restricted functions with proper modifiers
5.  **State Management**: Clear state transitions and validation

## Error Handling
--------------

The contract includes comprehensive error handling:

*   `Raffle__NotEnoughFunds()`: Insufficient entry fee
*   `Raffle__UpkeepNotNeeded()`: Invalid upkeep conditions
*   `Raffle__TransferFailed()`: Failed ETH transfer
*   `Raffle__NotOpen()`: Raffle not in open state

## Requirements
------------

*   Solidity ^0.8.19
*   Chainlink VRF v2.5
*   Chainlink Keepers
*   Funded VRF subscription
*   Sufficient ETH for gas costs

## Testing
-------

Test the contract by:

1.  Deploying to a testnet
2.  Funding the VRF subscription
3.  Adding the contract as a keeper job
4.  Testing various scenarios:
   -   Joining raffle
   -   Winner selection
   -   ETH transfers
   -   Error conditions