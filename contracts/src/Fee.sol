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

    function setDefaultFeeBp(uint16 _feeBp) public virtual onlyOwner {
        require(
            _feeBp <= BP_DENOMINATOR,
            "Fee: fee bp must be <= BP_DENOMINATOR"
        );
        defaultFeeBp = _feeBp;
        emit SetDefaultFeeBp(defaultFeeBp);
    }

    function setFeeBp(
        uint16 _dstChainId,
        bool _enabled,
        uint16 _feeBp
    ) public virtual onlyOwner {
        require(
            _feeBp <= BP_DENOMINATOR,
            "Fee: fee bp must be <= BP_DENOMINATOR"
        );
        chainIdToFeeBps[_dstChainId] = FeeConfig(_feeBp, _enabled);
        emit SetFeeBp(_dstChainId, _enabled, _feeBp);
    }    
    
    function setFeeOwner(address _feeOwner) public virtual onlyOwner {
        require(_feeOwner != address(0x0), "Fee: feeOwner cannot be 0x");
        feeOwner = _feeOwner;
        emit SetFeeOwner(_feeOwner);
    }
}
