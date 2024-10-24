// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BaseOFTWithFee.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract ProxyOFTWithFee is BaseOFTWithFee {
    using SafeERC20 for IERC20;

    IERC20 internal immutable innerToken;
    uint internal immutable ld2sdRate;

    // total amount is transferred from this chain to other chains, ensuring the total is less than uint64.max in sd
    uint public outboundAmount;

    constructor(
        address _token,
        uint8 _sharedDecimals,
        address _lzEndpoint
    ) BaseOFTWithFee(_sharedDecimals, _lzEndpoint) {
        innerToken = IERC20(_token);

        (bool success, bytes memory data) = _token.staticcall(
            abi.encodeWithSignature("decimals()")
        );
        require(success, "ProxyOFTWithFee: failed to get token decimals");
        uint8 decimals = abi.decode(data, (uint8));

        require(
            _sharedDecimals <= decimals,
            "ProxyOFTWithFee: sharedDecimals must be <= decimals"
        );
        ld2sdRate = 10 ** (decimals - _sharedDecimals);
    }
}
