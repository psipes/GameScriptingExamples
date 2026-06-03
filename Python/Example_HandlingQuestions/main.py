import random
import time


#############################################################
###                     OPTION 1                          ###
### Uses two functions to ask question and give answer    ###
#############################################################

#####This takes a string, the question to ask the user
#####It must only have 2 answers, Yes or No
#####It returns the answer that the user has given 
#####So that it can then be used in the two Answer branch respons
def userQuestionYesNo(qToBeAsked):
  userAnswer = ""
  while userAnswer != "yes" and userAnswer != "no":
    userAnswer = raw_input(qToBeAsked + ": ")
  return userAnswer

#####This takes the userAnswer (userQuestionYesNo(qTobeAsked)),
#####A string for what needs to be said if person answer yes
#####And a string fro what needs to said if person answer no
def twoAnswerBranch(userAnswer, positiveResult, negativeResult):
  if userAnswer == "yes":
    print(positiveResult)
  else:
    print(negativeResult)
  return userAnswer
#####Returns the user answer in case your story dialogue depends on which was chosen.


#############################################################
###                     OPTION 2                          ###
### Uses one functions to ask question and give answer    ###
#############################################################

#####Takes three strings: question to ask, answer to yes, answer to no
def yesNoQuestion (qToBeAsked, positiveResult, negativeResult):
  userAnswer = ""
  while userAnswer != "yes" and userAnswer != "no":
    userAnswer = raw_input(qToBeAsked + " ")
  
  if userAnswer == "yes":
    print(positiveResult)
  else:
    print(negativeResult)
  
  return userAnswer
  #####Returns user answer in case your story dialogue depends on which was chosen


  #####Example of using it with a branch in a story section
def storyPart1():
  if yesNoQuestion("Are you a girl?", "pink for you", "blue for you") == "yes":
    print ("Ah yes, let's go back to a time with princesses in towers growing frustrated to wait on the knights that were supposedly coming to save them...")
  else:
    print ("A brave knight...hopefully your princess hasn't grown tired and left her tower...we'll see.")

  ###You could continue story here or have two other functions that can be called in your if/else statements for how it continues on

  return True



playAgain = 'yes'
while playAgain == 'yes': 
  #twoAnswerBranch(userQuestionYesNo("Are you a girl?"), "Pink it is", "Blue it is")
  #yesNoQuestion("Are you a girl", "pink for you", "blue for you")
  storyPart1()
  playAgain = raw_input("Do you want to play again: ")

