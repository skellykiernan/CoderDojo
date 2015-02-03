high_score = 100
score = int(input('Input a score:'))
if score > high_score:
    high_score = score
    print('New High Score ', high_score)
elif score == high_score:
    print('Your score equals the high_score of ', high_score)
else:
    print('Your score is ', score)