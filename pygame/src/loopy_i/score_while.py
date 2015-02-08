# Initialise what is needed by the game
done = False
score = 0
high_score = 121
# game loop, where a game is played
while not done:
    answer = input('Quit Game(y/n):')
    if 'y' == answer.lower():
        done = True
    # Game Logic, simulate by adding points to the game score
    # can input negative and positive integers
    points = int(input('Enter points won this iteration:'))
    score += points
# Display the score plus if you have the high score
if score > high_score:
    high_score = score
    print('New High Score ', high_score)
elif score == high_score:
    print('Your score equals the high_score of ', high_score)
else:
    print('Your score is ', score)

print('Good Bye')