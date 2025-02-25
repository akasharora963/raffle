// SPDX-License-Identifier:MIT
pragma solidity ^0.8.28;

/**
 * @title Raffle
 * @author Akash Arora
 * @dev implements Chainlink VRF
 * @notice This contrcat is for implementing Raffle
 */

contract Raffle {
    /** Errors */
    error Raffle__NotEnoughFunds();

    uint256 private immutable i_entryFee;
    address payable[] private s_players;

    /** Events */
    event RaffleJoined(address indexed player);

    constructor(uint256 _entryFee) {
        i_entryFee = _entryFee;
    }

    /**
     * @dev This function is for joining the raffle
     * @notice This function is for joining the raffle
     */
    function joinRaffle() public payable {
        if (msg.value < i_entryFee) {
            revert Raffle__NotEnoughFunds();
        }

        s_players.push(payable(msg.sender));

        emit RaffleJoined(msg.sender);
    }
    /**
     * @dev This function is for choosing the winner of the raffle
     * @notice This function is for choosing the winner of the raffle
     */
    function chooseWinner() public {}

    /**Getters */
    function getEntryFee() public view returns (uint256) {
        return i_entryFee;
    }
}
