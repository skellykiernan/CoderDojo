print('What is your name? ')
name = input()
greeting = 'Hello ' + name
print(greeting)
print('"name" refers to a', type(name), end=' ')
print('that contains', name)
age = input('What age are you? ')
age = int(age)
print('Your age is ', age)
print('"age" refers to a', type(age), end=' ')
print('that contains', age)
# suspicious question next !!!, be careful
# which questions you answer truthfully
money = input('How much money is in your pocket you? ')
money = float(money)
print('You have €', money)
print('"money" refers to a', type(money), end=' ')
print('that contains', money)