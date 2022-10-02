#Decided there was no need for a for loop could get the length through if statements
def blah_function(inputString):
    if len(inputString) < 10:
        new_output = len(inputString)
    elif len(inputString) >= 10:
        new_output = len(inputString) * 4

    return new_output
#testing with two test cases in which will be outputted within 'Question1_output.txt'
test1 = blah_function('inputString')
test2 = blah_function('Hello')
print(f"Where inputString = inputString: {test1}")
print(f"Where inputString = Hello: {test2}")