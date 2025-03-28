# my journey to being a Smart Contract Engeneer 
IN THIS DOC I WILL NOT CORRECT OR FORMAT MY NOTES ? I WILL KEEP  LINGUISTIQUES ERRORS AND 
DONT USE   AI. MY PURPOSE IS TO EXPOSE MY FLAWS TO CORRECT THEM LATER;
# ------------------------------------------------------------------
#                        BLOCKCHAIN BASICS
# ------------------------------------------------------------------
1.First Step: 
definition of blockchain : is a decentrilized and distributed ledger that record transactions
in a sercur and transparent manner ( base on concensus and immutability cant be changed)

1. deference between bitcoin and ethereum : bitcoin store value,  eth store utility.
2. smart contract or hybred smart contract is a contract that is added in the blockchain.
3. L2 is the layer 2 of a blockchain to slove the problem of scability there are thow differents types: Zk and 
and optimistic rullups ![table to compare ](image.png)
4. the purpose of smart contrcat is self-executing contracts with terms directly written into code . they run in 
blockchain network and automatically  enforce agreement without the need of intermedairies.
5. chainlink allow as to build the hybrid smart contract.

QUIZ1 3/3

5. features of blockchain : decentralized , transparency , security and immutablity, speed and effenciency .
6. warming up by creating a metamask wallet and send transactions or fund your accounts
     -Go to tenderly and create a personnalisze network added to your wallet and fund the account 
     ( is it a fake network with fake money ![alt text](image-1.png)) 
     - Send money from account 1 to account 2
     - GET FREE sepolia ETH from sepolia faucet. ( recommanded is faucet.chain.link)
     - Post on X and tag patrick collins 
     -** The more poeple are sending TX the more exepensives  are your gas fees  cost  are **.
     - What is the role of the**transaction fee** in Ethereum transactions? The amount rewarded to the block 
      producer for processing the transaction.
     - What is the role of **the gas price** in Ethereum transactions? To set the cost per unit of gas 
      specified for the transaction.

QUIZ2 2/4

7. How do blockchains work : HASH  SHA256 (the lengh of the string hash doesnt change it is fixed what ever the data )
                            BLOCK : "1"                          BLOCK: "2"
                            NONCE:23456                          NONCE: "34563"
                            DATA: "hbjnkkljbhjb hello ..."       DATA:"the next block"
                            HASH: "fgvhjbk......"                PREV : "fgvhjbk......"
                                                                 HASH :"zretfygjhkl......"
                                                                
8. A pivate key only known for the holder to "sign" transactions . AND the public key is for other to verify the transactions.
9. What this youtube video :https://www.youtube.com/watch?v=MGemhK9t44Q  **Can ETH Become DEFLATIONARY? EIP 1559 Explained**
first price auction EIP1559 / basefee : minimun fee to pay for a transaction it is not fix changed selon  la charge de  network activity 50 % it is the pincipe of biding to include yout transaction to the block space
the base fee is burnt 
10. concensus : is a mechanisme system there are 2 type proof of stake (PoS)  talking about validaters and proof of work (PoW) talking about miners.
there TWO FAMOUS ATTACK /sybil attack and 51 % attack 
I am interrested by the proof of stake cuz is the cheapest   and uses less electrecity 

11. The blockchain dilemma ( Security SCalability Decentrilized ) solved by the L2

QUIZ3 83 %


12. ### Rollup Stages

1. **Stage 0**: In this initial stage, the rollup's governance is largely in the hands of the operators and a security council, ensuring that critical decisions and actions are overseen by a _trusted group_. The open-source software allows for the reconstruction of the state from L1 data, ensuring transparency and accessibility. Users in this stage have an exit mechanism that allows them to leave the rollup within seven days. However, this often requires actions from an entity/operator.

2. **Stage 1**: In this stage, governance evolves to be managed by _smart contracts_, although the _security council_ still plays an important role (e.g. solving bugs). At this stage, the proof system becomes fully functional, enabling decentralized submission of validity proofs. The exit mechanism is improved, allowing users to exit independently without needing operator coordination.

3. **Stage 2**: In this final stage, the rollup achieves full decentralization with governance entirely managed by smart contracts, removing the need for operators or council interventions in everyday operations. The proof system at this stage is permissionless and the exit mechanism is also fully decentralized. The security council's role is now strictly limited to addressing any errors that occur on-chain, ensuring that the system remains fair without being overly reliant on centralized entities.


why zksync is recommended cus the security , low cost EVM compatibility eth wallet support 

# ------------------------------------------------------------------
#                    INTRO TO PYTHON AND VYPER
# ------------------------------------------------------------------

1. GO to youtube and watch (Learn Vyper 0.2):it is an introduction to vyper execute the code and read details in the official vyper website.
2. START LEARNING BY CODING Workshop 1: > Section 1: Welcome to Remix - Favorite's List  ##### DONE 
What is a revert : when any actions has been done and send the reamaining gas back
4. Understaing chainlink how to work with it and find the price of the real world
5. How to read from other contract 
6. there are two functions to senf money : send and rawcall
7. How to resset DynArray  []

8. START LEARNING BY CODING Workshop 2 : > Section 1: Remix Buy Me A Coffee  ##### DONE 

9. boa is a powerful tool to deploy a contact without building a transaction using python. just use this tool to load your smart contrcat . just in a single line 
you should take it easy first eg : https://github.com/Cyfrin/boa-favorites-cu/blob/main/deploy_favorites.py

10. YOU should concentrzte on the easiet way to compile a smart contract by using titanoboa and for the toool is moccassain or mox 

11. you just need to see the section mox fav and work with that incredible.

