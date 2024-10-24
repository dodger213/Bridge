// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../OFTCoreV2.sol";
import "./IOFTWithFee.sol";
import "./Fee.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";

abstract contract BaseOFTWithFee is OFTCoreV2, Fee, ERC165, IOFTWithFee {
    constructor(
        uint8 _sharedDecimals,
        address _lzEndpoint
    ) OFTCoreV2(_sharedDecimals, _lzEndpoint) {}
}
