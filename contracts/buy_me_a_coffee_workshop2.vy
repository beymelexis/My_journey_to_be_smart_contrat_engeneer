 # pragma version 0.4.0 
"""
@license MIT 
@title Buy Me A Coffee!
@author You!
@notice This contract is for creating a sample funding contract
"""

# We'll learn a new way to do interfaces later...
interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view
    def version() -> uint256: view
    def latestAnswer() -> int256: view

# Constants & Immutables
MINIMUM_USD: public(constant(uint256)) = as_wei_value(5, "ether")
PRICE_FEED: public(immutable(AggregatorV3Interface)) # 0x694AA1769357215DE4FAC081bf1f309aDC325306 sepolia
BTC_USD_PRICE_FEED: public(immutable(AggregatorV3Interface))
PRECISION: constant(uint256) = 1 * (10 ** 18)

# Storage
funders: public(DynArray[address, 1000])
funder_to_amount_funded: public(HashMap[address, uint256])
total_amount: public(uint256)
owner: public(address)

# With constants: 262,853
@deploy
def __init__(price_feed: address, btc_usd_feed : address):
    PRICE_FEED = AggregatorV3Interface(price_feed)
    BTC_USD_PRICE_FEED = AggregatorV3Interface (btc_usd_feed)
    self.owner = msg.sender

@external
@view
def get_btc_price() -> uint256:
    price: int256 = staticcall BTC_USD_PRICE_FEED.latestAnswer()
    return convert(price, uint256)

@external
@payable
def fund():
    self._fund()

@internal
@payable
def _fund():
    """Allows users to send $ to this contract
    Have a minimum $ amount to send

    How do we convert the ETH amount to dollars amount?
    """
    usd_value_of_eth: uint256 = self._get_eth_to_usd_rate(msg.value)
    assert usd_value_of_eth >= MINIMUM_USD, "You must spend more ETH!"
    self.funders.append(msg.sender)
    self.funder_to_amount_funded[msg.sender] += msg.value


@external
def withdraw():
    """Take the money out of the contract, that people sent via the fund function.

    How do we make sure only we can pull the money out?
    """
    assert msg.sender == self.owner, "Not the contract self.owner!"
    raw_call(self.owner, b"", value = self.balance)
    # send(self.owner, self.balance)
    # resetting
    for funder: address in self.funders:
        self.funder_to_amount_funded[funder] = 0
    self.funders = []

@internal
@view
def _get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    """
    Chris sent us 0.01 ETH for us to buy a coffee
    Is that more or less than $5?
    """
    price: int256 = staticcall PRICE_FEED.latestAnswer() 
    eth_price: uint256 = (convert(price, uint256)) * (10**10)
    eth_amount_in_usd: uint256 = (eth_price * eth_amount) // PRECISION
    return eth_amount_in_usd # 18 0's, 18 decimal places

@external 
@view 
def get_eth_to_usd_rate(eth_amount: uint256) -> uint256:
    return self._get_eth_to_usd_rate(eth_amount)


# 1. How much money has been funded in ETH?
@external
def total_amount_funded()-> uint256 :
    self.total_amount = 0
    for funder: address in self.funders:
        self.total_amount = self.total_amount + self.funder_to_amount_funded[funder]
    return self.total_amount// (10**18)

@external
def change_owner(new_owner: address):
    assert msg.sender == self.owner, "Only the owner can change ownership"
    self.owner = new_owner

@external 
@payable 
def __default__():
    self._fund()



