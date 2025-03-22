from contracts import favorites
from vyper  import compile_code
from web3 import Web3



def main():
    print("Deploying contract")
    with open("favorites.vy") as f:
        favorites_code = f.read()
        compilation_details = compile_code(favorites_code, output_formats=['bytecode'])
    
    w3=Web3(Web3.HTTPProvider("https://virtual.sepolia.rpc.tenderly.co/76abc7fb-bd65-4d92-aa91-97cb7575f594"))
    favorites_contract = w3.eth.contract(abi=compilation_details['abi'], bytecode=compilation_details['bytecode'])
   

if __name__ == "__main__":
    main()
