from web3 import Web3
from vyper import compile_source

# Connect to local Ethereum node
w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))

# Compile the Vyper contract
contract_source_code = """
# ...existing code from /home/beym/My_journey_to_be_smart_contrat_engeneer/contracts/favorites.vy...
"""
compiled_contract = compile_source(contract_source_code, output_values=["abi", "bin"])
contract_id, contract_interface = compiled_contract.popitem()

# Deploy the contract
def deploy_contract():
    account = w3.eth.accounts[0]
    contract = w3.eth.contract(
        abi=contract_interface["abi"], bytecode=contract_interface["bin"]
    )
    tx_hash = contract.constructor().transact({"from": account})
    tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
    print(f"Contract deployed at address: {tx_receipt.contractAddress}")

if __name__ == "__main__":
    deploy_contract()
