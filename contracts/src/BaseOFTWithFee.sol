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

    /************************************************************************
     * public functions
     ************************************************************************/
    function sendFrom(
        address _from,
        uint16 _dstChainId,
        bytes32 _toAddress,
        uint _amount,
        uint _minAmount,
        LzCallParams calldata _callParams
    ) public payable virtual override {
        (_amount, ) = _payOFTFee(_from, _dstChainId, _amount);
        _amount = _send(
            _from,
            _dstChainId,
            _toAddress,
            _amount,
            _callParams.refundAddress,
            _callParams.zroPaymentAddress,
            _callParams.adapterParams
        );
        require(
            _amount >= _minAmount,
            "BaseOFTWithFee: amount is less than minAmount"
        );
    }

    function sendAndCall(
        address _from,
        uint16 _dstChainId,
        bytes32 _toAddress,
        uint _amount,
        uint _minAmount,
        bytes calldata _payload,
        uint64 _dstGasForCall,
        LzCallParams calldata _callParams
    ) public payable virtual override {
        (_amount, ) = _payOFTFee(_from, _dstChainId, _amount);
        _amount = _sendAndCall(
            _from,
            _dstChainId,
            _toAddress,
            _amount,
            _payload,
            _dstGasForCall,
            _callParams.refundAddress,
            _callParams.zroPaymentAddress,
            _callParams.adapterParams
        );
        require(
            _amount >= _minAmount,
            "BaseOFTWithFee: amount is less than minAmount"
        );
    }
}
