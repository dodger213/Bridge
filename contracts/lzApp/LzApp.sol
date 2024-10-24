// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "../interfaces/ILayerZeroReceiver.sol";
import "../interfaces/ILayerZeroUserApplicationConfig.sol";
import "../interfaces/ILayerZeroEndpoint.sol";
import "../libraries/BytesLib.sol";

/*
 * a generic LzReceiver implementation
 */
abstract contract LzApp is Ownable, ILayerZeroReceiver, ILayerZeroUserApplicationConfig {}