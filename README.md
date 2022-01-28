# Key Health Check

This is a simple Clarity smart contract that runs on the [Stacks blockchain](https://stacks.co).

It contains a map that stores a user's principal and the last block height checked in at by calling the contract.

There are two functions:

- `check-in`: public function that takes the `contract-caller` address and stores it in the map along with the current block height
- `last-checked`: read-only function that requires a principal as input, then returns either the last block height they checked in or an error if not found

## Testing

Given the simplicity of this contract I tested it via Clarinet Console, sample commands below:

```
::advance_chain_tip 5
(contract-call? .key-health-check check-in)
(contract-call? .key-health-check last-checked 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(contract-call? .key-health-check last-checked 'ST2NEB84ASENDXKYGJPQW86YXQCEFEX2ZQPG87ND)
::advance_chain_tip 95
(contract-call? .key-health-check check-in)
(contract-call? .key-health-check last-checked 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
```
