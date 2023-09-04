# Simpletoken Introduction and Deployment

### Simpletoken Introduction

https://community.starknet.io/t/starknet-new-paradigm-wallet-and-token/95731

### GitHub Link

https://github.com/wenzhenxiang/starknet_simple_token/

### Declare Simpletoken Contract

`starkli declare target/dev/simpletoken_SimpleToken.sierra.json --network=goerli-1 --compiler-version=2.1.0`

```rust

WARNING: you're using the sequencer gateway instead of providing a JSON-RPC endpoint. This is strongly discouraged. See <https://book.starkli.rs/providers> for more details.
Enter keystore password:
Declaring Cairo 1 class: 0x00e858e833a8093d9d2d23ec9bf0d3e0618dfd32642b24251c01d3271b052764
Compiling Sierra class to CASM with compiler version 2.1.0...
CASM class hash: 0x01b7f830af845934bd078523b099086bad9ec951661aa71d96bf584b38987c08
Contract declaration transaction: 0x05a005450f3ec4dbb4de63578883d31b8f8071262f34973bf187ca13608003b1
Class hash declared:
0x00e858e833a8093d9d2d23ec9bf0d3e0618dfd32642b24251c01d3271b052764

```

Format for constructing parameters

ref self: ContractState,
name_: felt252,
symbol_: felt252,
decimals_: u8,
initial_supply: u256,
recipient: ContractAddress

### Deploy Simpletoken Contract

starkli deploy 0x00e858e833a8093d9d2d23ec9bf0d3e0618dfd32642b24251c01d3271b052764 0x4141 0x4242 12 0xfffffffff 0 0x036cdeedd45f917a0ed47082a782628cb7bbe5f02d5a81b07c1697db8eda08f8 --network=goerli-1

Note: u256 is made up of two felts, so it takes up two.

```bash
WARNING: you're using the sequencer gateway instead of providing a JSON-RPC endpoint. This is strongly discouraged. See <https://book.starkli.rs/providers> for more details.
Enter keystore password:
Deploying class 0x00e858e833a8093d9d2d23ec9bf0d3e0618dfd32642b24251c01d3271b052764 with salt 0x076d41bf0f15c7575155f166a0e9255f231c4228327d70a5873cd7c97d2bac63...
The contract will be deployed at address 0x06fcc169f27c3bb2e7549ae993fca974c4dcb06834e9d0469de9dc620c11e1c6
Contract deployment transaction: 0x01a3370418eb3209992f7ea3d79cfdbe18153c11ce7357617ae2876623e691ee
Contract deployed:
0x06fcc169f27c3bb2e7549ae993fca974c4dcb06834e9d0469de9dc620c11e1c6

```

### invoke Simple Contract, Initiate Transfer

`starkli invoke 0x06fcc169f27c3bb2e7549ae993fca974c4dcb06834e9d0469de9dc620c11e1c6 transfer 0x063077A1b4e4858A61848b2FBDb2E040b38B0eE3cbcdBCb798B70664a8258584 u256:300`

Note: The u256 in the above command is simplified using strkli's [argument parsing](https://book.starkli.rs/argument-resolution.html).

```bash
WARNING: no valid provider option found. Falling back to using the sequencer gateway for the goerli-1 network. Doing this is discouraged. See <https://book.starkli.rs/providers> for more details.
Enter keystore password:
Invoke transaction: 0x06c95769df3da1c93ae9ab64e1edb6a8f2abe3f53d3a006b55f189c73b1502c9

```

### call Simple Contract，Check Token Balance

`starkli call 0x06fcc169f27c3bb2e7549ae993fca974c4dcb06834e9d0469de9dc620c11e1c6 balance_of 0x036cdeedd45f917a0ed47082a782628cb7bbe5f02d5a81b07c1697db8eda08f8`

```bash
WARNING: no valid provider option found. Falling back to using the sequencer gateway for the goerli-1 network. Doing this is discouraged. See <https://book.starkli.rs/providers> for more details.
[
    "0x0000000000000000000000000000000000000000000000000000000ffffffed3",
    "0x0000000000000000000000000000000000000000000000000000000000000000"
]

```
