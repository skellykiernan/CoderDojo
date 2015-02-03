high_score = 100
score = int(input('Input a score:'))
if score > high_score:
    high_score = score
    print('New High Score ', high_score)
else:
    print('Your score is ', score)