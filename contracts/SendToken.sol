//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {IAxelarGateway} from '@axelar-network/axelar-gmp-sdk-solidity/contracts/interfaces/IAxelarGateway.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

// This contract is meant to transfer tokens from one chain to another using axelar gateway mechanism
// In this contract we are trnasfer weth token

contract SendToken {
    IAxelarGateway public immutable i_axelarGatway;
    IERC20 public immutable i_token;
    uint256 public constant AMOUNT = 1 * 10**16;

/** 
 @dev GateWay Contract: 0xe432150cce91c13a887f7D836923d5597adD8E31 for deploying this contract at goerli testnet
 @dev chain-name is ethereum-sepolia which is the destination chain name for axelar ecosystem
*/
    constructor(address _gateway, address _token) {
        i_axelarGatway = IAxelarGateway(_gateway);
        i_token = IERC20(_token);
    }

    function sendToken(string calldata _destinationChain) public {
        i_token.approve(address(i_axelarGatway), AMOUNT);

        i_axelarGatway.sendToken('ethereum-sepolia', _destinationChain, 'WETH', AMOUNT);
    }
}