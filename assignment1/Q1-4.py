from collections import deque #import for q2

def isValid(s): #create a dict storing a-z : num of occurances
    dictionary = {}
    if (not s):
        return "YES"    #for edge case where string is empty
    
    for char in s:  #loop to convert string to dict
        if char == " ":
            continue
        elif char in dictionary:    #create key if not exist
            dictionary[char] = dictionary.get(char) + 1
        else:   #add +1 to value if exists
            dictionary[char] = 1
    
    #compare largest and smallest values with [0] and [-1], if > 1 then NO
    value_list = list(dictionary.values())
    value_list.sort()
    
    #Case: 2+ occurances of 2 diff. values
    counter = 0 #counter tracks repeated values
    flag = 389  #random flag value
    for value in range(len(value_list) - 1):
        if (value_list[value] == value_list[value+1]):
            counter += 1
            if (flag == 1): #allows counter to update to 2 if else statement has been reached once
                counter += 1
            flag = 0
            if (counter < 2):
                counter = 0 #resets counter if it didn't pass the flag
        else:
            if (flag == 0):
                flag = 1
            counter = 0

    if (value_list[0] > 1 and value_list[-1] - value_list[0] > 0 and value_list[0] != value_list[1]
        or counter > 1):    #Preliminary conditions so YES checks work accurately
        return "NO"
    elif (value_list[-1] - value_list[0] < 2 or 
        value_list.pop(0) == 1 and value_list[-1] - value_list[0] == 0):    #YES checks
        return "YES"
    elif (value_list):  #May be redundant but checks if list is empty
        return "YES"
    else:
        return "NO"

#Testing methods
print(isValid("abccdd"))
print(isValid("aabbcdddeefghi"))
print(isValid("abcdefghhgfedecba"))
print(isValid("qweqweqwe"))
print(isValid("aaabbcc"))

#diff greater than 2 and no 1 to pop out = NO
#2, 3, 3, 3 case - [0] is greater than 1 and multiple occurances of num higher than it = NO
#at least 2 occurances of 2 diff values = NO

#//////////////////////////////// Question 2
def isBalanced(str):
    stack = deque()
    #push open parenthesis into stack do checks each time
    try:    #follows format: if closing bracket, pop if last element is its opening bracket else append
        for bracket in str:
            if (bracket == ']'):
                if (stack[-1] == '['):
                    stack.pop()
                else:
                    stack.append(bracket)
            elif (bracket == '}'):
                if (stack[-1] == '{'):
                    stack.pop()
                else:
                    stack.append(bracket)
            elif (bracket == ')'):
                if (stack[-1] == '('):
                    stack.pop()
                else:
                    stack.append(bracket)
            else:
                stack.append(bracket)
    except IndexError:
        stack = [1]   #will always result in returning NO

    if (len(stack) == 0):   #if the stack is emptied, it is balanced
        return "YES"
    else:
        return "NO"

print(isBalanced('{[()]}'))
print(isBalanced('{[(])}'))
print(isBalanced('{{[[(())]]}}'))
print(isBalanced('{(({{[[()]]}}))}'))
print(isBalanced('{)}'))

#//////////////////////////// Question 3

class Node:
    def __init__(self, N, leftChild=None, rightChild=None): #constructor of Node
        self.N = N
        self.leftChild = leftChild
        self.rightChild = rightChild
        
    def preOrder(self):
        traverse = [self.N] #adds label immediately 
        if(self.leftChild is not None):     #left traversal
            traverse += self.leftChild.preOrder()
        if(self.rightChild is not None):    #right traversal
            traverse += self.rightChild.preOrder()
        if self.leftChild is None and self.rightChild is None:  #leaf
            return traverse
        return traverse
    
    def postOrder(self):
        traverse = []   #add labels when we reach leaf node or at the end of function
        if(self.leftChild is not None):     #left traversal
            traverse += self.leftChild.postOrder()
        if(self.rightChild is not None):    #right traversal
            traverse += self.rightChild.postOrder()
        if self.leftChild is None and self.rightChild is None:  #leaf
            return [self.N]
        return traverse+[self.N]
    
    def inOrder(self):
        traverse = []   #add labels later
        if(self.leftChild is not None):     #left traversal
            traverse += self.leftChild.inOrder()
        traverse += [self.N]
        if(self.rightChild is not None):    #right traversal
            traverse += self.rightChild.inOrder()
        if self.leftChild is None and self.rightChild is None:  #leaf
            return [self.N]
        return traverse

    def sumTree(self):  #pick any traversal and get its sum
        return sum(self.inOrder())

root = Node(2, Node(1, Node(6), Node(3)), Node(3, None, Node(9)))
print(root.preOrder())
print(root.postOrder())
print(root.inOrder())

root2 = Node(1, Node(2, Node(3)), Node(4,None,(Node(5, None, Node(6, None, Node(7))))))
print(root2.preOrder())
print(root2.postOrder())
print(root2.inOrder())

root3 = Node(3, Node(2), Node(3, Node(3, None, Node(3)), Node(5)))
print(root3.preOrder())
print(root3.postOrder())
print(root3.inOrder())

#///////////////////////////////// Q4
try:
    with open("input.txt", "r") as txt:
        lines = txt.readlines() #lines as a list
        char_count = 0
        words = 0
        for line in lines:  #updates counter each loop
            words += len(line.split())
            char_count += len(line)
    print("Total number of lines:", len(lines))
    print("Total number of words:", words)
    print("Total number of characters", char_count)

    lines.reverse()
    with open("reversed_lines.txt", "w") as outFile:    #write out and create new file
        outFile.write(''.join(lines))
    
except FileNotFoundError:
    print("Encountered an error")