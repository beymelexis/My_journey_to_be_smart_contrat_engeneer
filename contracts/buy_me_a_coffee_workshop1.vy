#pragma version 0.4.0
#@License : MIT

#get funds from users
#withdraw funds
#set a minimum funding value in USD

interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view
    def version() -> uint256: view
    def latestAnswer() -> int256: view

MINIMUM_USD : public(constant(uint256)=as_wei_value(1,"ether")
price_feed : AggregatorV3Interface
OWNER : public(imutabel(address))
funders : public(DynArray[address,100])
funder_to_amount_funded: public(HashMap[address,uint256])
@deploy
def __init__(price_feed_address: address):
    self.minimum_usd= as_wei_value(1,"ether")
    self.price_feed=AggregatorV3Interface(price_feed_address)
    self.owner= msg.sender 


@external
@payable 
def fund():
    """Allows users to send money and set the minimum $ 
    1. How do we send ETH to this conctact 
    """
    usd_value_of_eth: uint256= self._get_eth_to_usd_rate(msg.value)
    assert usd_value_of_eth >= self.minimum_usd ,"You must spend more ETH !"
    self.funders.append(msg.sender)
    self.funder_to_amount_funded[msg.sender]= self.funder_to_amount_funded[msg.sender]+ msg.value


@internal
@view
def _get_eth_to_usd_rate(eth_amount: uint256)-> uint256:
    price: int256 = staticcall self.price_feed.latestAnswer()
    price_eth: uint256 = convert(price, uint256) * (10 ** 10)
    eth_amount_usd: uint256 = (eth_amount * price_eth ) // (1* (10 ** 18))
    return eth_amount_usd
    
@external
@view
def get_eth_to_usd_rate(eth_amount: uint256)-> uint256:
   return self._get_eth_to_usd_rate(eth_amount)


@external
def withdraw():
    """
    How to withdraw the money sent to this contract via the fund function 
    How to make sure we only the one who can call this function  
    """
    assert msg.sender == self.owner ,"You are not the owner of that contract "
    send(self.owner, self.balance)
    for funder :address in self.funders:
       self.funder_to_amount_funded[funder]=0 
    self.funders= []

    
