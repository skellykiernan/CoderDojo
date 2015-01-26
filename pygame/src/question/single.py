#! /usr/bin/env python3
score = 0
city = input('What city is the capital of Ireland? ')
if city == 'Dublin':
    score += 3
    print('Correct')
else:
    score -= 1
    print('Wrong,  Correct answer is Dublin')
print('Score is ' + str(score))
