#pragma version 0.4.0
#@license MIT

# ------------------------------------------------------------------
#                         STATE VARIABLES
# ------------------------------------------------------------------
struct Person:
    name: String[64]
    age: uint256
    favorite_number: uint256
my_favorite_number: public(uint256)
person: public(Person)
list_of_favorite_numbers: public(uint256[5]) 
# ------------------------------------------------------------------
#                            FUNCTIONS
# ------------------------------------------------------------------
@deploy
def __init__():
    self.my_favorite_number = 42
    self.person.name = "Alice"
    self.person.age = 50
    self.person.favorite_number = self.my_favorite_number

@external 
def add():
    self.my_favorite_number += 1
@external
def add_person(name: String[64], age: uint256, favorite_number: uint256):
    self.person.name = name
    self.person.age = age
    self.person.favorite_number = self.my_favorite_number
    self.list_of_favorite_numbers[0] = favorite_number
    self.my_favorite_number += 1
