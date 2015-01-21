BONUS = 10
score = 0
# character fell while climbing a tree
health = 100 - 6
print(health)
# character reached top tree
score = score + 24
# found golden coin in the tree
score = score + BONUS
print(score)
# fell again
health = health - 6
print(health)
