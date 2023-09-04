// SPDX-License-Identifier: MIT

use starknet::ContractAddress;



#[starknet::interface]
trait ISimpleToken<TContractState> {
    fn total_supply(self: @TContractState) -> u256;
    fn balance_of(self: @TContractState, account: ContractAddress) -> u256;
    fn transfer(ref self: TContractState, recipient: ContractAddress, amount: u256);
}
