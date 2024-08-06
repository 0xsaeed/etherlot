// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.24;
pragma abicoder v2;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract EtherLot {
    address public manager;
    address public feeAddress;
    uint256 public lastTimestamp;
    uint256 public interval;
    uint256 public lotteryCounter;
    uint256 public ticketPrice;

    uint8 public commission;

    bool public ticketPriceChanged = false;
    bool public commissionChanged = false;

    enum Status {
        Pending,
        Open,
        Close,
        Claimable,
        Claimed
    }
    struct LotteryRound {
        Status status;
        uint256 lotteryNumber;
        address[] participants;
        mapping(address => string[]) tickets;
        string winningTicket;
        uint256 prizeAmount;
        bool isClaimed;
    }

    mapping(uint256 => LotteryRound) public lotteries;

    constructor(uint256 updateInterval, address _feeAddress) {
        manager = msg.sender;
        lastTimestamp = block.timestamp;
        interval = updateInterval;
        feeAddress = _feeAddress;
        lotteryCounter = 1; // Start with lottery number 1
    }


}
