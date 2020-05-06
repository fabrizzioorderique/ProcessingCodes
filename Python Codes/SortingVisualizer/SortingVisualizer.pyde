'''
Sorting Algorithm Visualizer
>>> Visualizes sorting algorithms such as bubble sort, selection sort, and merge sort

@author Piero Orderique
@date 05/05/2020
'''
#import neccesities
import random as r

#setup variables
width = 2000
height = 1000
totalElements = 100

#setup bar class
class bar(object):
    def __init__(self, xpos, hgt):
        self.hgt = -hgt
        self.xpos = xpos
        self.wdth = width/totalElements
    def __str__(self):
        return 'Height '+str(self.hgt)+' at position: '+str(self.xpos)
    def show(self):
        fill(0)
        rect(self.xpos,height,self.wdth,self.hgt)
    def getHeight(self):
        return self.hgt
    def setHeight(self, hgt):
        self.hgt = hgt
    def swapHeights(self, otherBar):
        temp = self.getHeight()
        self.setHieght(otherBar.getHeight())
        otherBar.setHeight(temp)

#initialize manual testing list:
# MASTER_LIST = []
# for i in range(len(MASTER_LIST):
#     bars.append(bar(MASTER_LIST[i]))

#intitalize random testing list:
upperRange = height - 100
RANDOM_LIST = []
bars = []
for i in range(totalElements):
    RANDOM_LIST.append((int)(r.random()*upperRange))
    bars.append(bar(0,RANDOM_LIST[i]))
    
def printBars():
    for bar in bars:
        print(bar)

def setup():
    size(width, height)
    background(255)
    fill(0)
    noLoop()
    
def draw():
    background(255)
    for bar in bars:
        bar.show()

c = bar(0,4)
a = c
print(str(RANDOM_LIST))
printBars()
