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
    uint256 public newTicketPrice;
    uint256 public maxTicketsLimit;

    uint8 public commissionRate;
    uint8 public newCommissionRate;
    uint8 public maxTicketsPerTransaction;

    bool public ticketPriceChanged = false;
    bool public commissionRateChanged = false;

    enum Status {
        Pending,
        Open,
        Close,
        Claimable,
        Claimed
    }

    struct LotteryRound {
        Status status;
        // uint256 lotteryNumber; //it can be ommited since we can use the key of the mapping or array index
        address[] participants; //it can be ommited
        mapping(uint256 => address) tickets; // it can be array of tickets also insted of hashmap
        uint256 winningTicket;
        uint256 prizeAmount;
        uint256 commissionFeeAmount;
        uint256 numberOfTickets;
        bool isClaimed;
    }

    mapping(uint256 => LotteryRound) public lotteries; // or array of lotteries but it will be more expensive

    /* I'm not sure this gonna be used or not */
    mapping(address => uint256[]) public userLotteries;

    constructor(
        uint256 updateInterval,
        address _feeAddress,
        uint256 _ticketPrice,
        uint8 _commissionRate,
        uint8 _maxTicketsPerTransaction,
        uint256 _maxTicketsLimit
    ) {
        manager = msg.sender;
        lastTimestamp = block.timestamp;
        interval = updateInterval;
        feeAddress = _feeAddress;
        lotteryCounter = 1; // Start with lottery number 1
        ticketPrice = _ticketPrice;
        commissionRate = _commissionRate;
        maxTicketsPerTransaction = _maxTicketsPerTransaction;
    }

    function changeTicketPrice() returns () {}

    function changeCommissionRate() returns () {}

    function buyTickets() returns () {}

    function buyTicket() returns () {}

    function startLottery() returns () {}

    function pickeWinner() returns () {}

    function claimPrize() returns () {}
    
    function getRandomeNumber() returns () {}

}
