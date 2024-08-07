// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.24;
pragma abicoder v2;

// Import statements
// Uncomment this line to use console.log
import "hardhat/console.sol";

// Interfaces

// Libraries

// Contracts
contract EtherLot {
    // Type declarations
    // State variables

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

    mapping(address => uint256[]) public userLotteries; // I'm not sure this gonna be used or not


    // Events

    // Errors

    // Modifiers

    // Functions
    //  *Constructor
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
    // *Receive Function (if exists)

    // *Fallback Function (if exists)

    // *External functions

    // *External functions that are view

    // *External functions that are pure

    // *Public functions

    // *Internal functions

    // *Private functions
        
    function changeTicketPrice() returns () {}

    function changeCommissionRate() returns () {}

    function buyTickets(
        uint8 _numberOfTickets,
        uint256 _ticketPrice
    ) returns () {}

    function buyTicket() returns () {}

    function _startLottery(uint256 _lotteryNumber) internal returns () {}

    function pickeWinner() internal returns () {}

    function claimPrize() returns () {}

    function getRandomeNumber() internal returns () {}
}
