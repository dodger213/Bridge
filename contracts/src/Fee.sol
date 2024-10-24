// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

abstract contract Fee is Ownable {
    uint public constant BP_DENOMINATOR = 10000;

    mapping(uint16 => FeeConfig) public chainIdToFeeBps;
    uint16 public defaultFeeBp;
    address public feeOwner; // defaults to owner

    struct FeeConfig {
        uint16 feeBP;
        bool enabled;
    }

    event SetFeeBp(uint16 dstchainId, bool enabled, uint16 feeBp);
    event SetDefaultFeeBp(uint16 feeBp);
    event SetFeeOwner(address feeOwner);

    constructor() {
        feeOwner = owner();
    }
}
