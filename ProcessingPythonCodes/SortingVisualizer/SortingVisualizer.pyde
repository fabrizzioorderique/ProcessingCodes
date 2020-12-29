'''
Sorting Algorithm Visualizer
>>> Visualizes sorting algorithms such as bubble sort, selection sort, and merge sort

@author Piero Orderique
@date 05/05/2020
'''
#import neccesities
import random as r
from time import sleep

#setup variables
width = 2000
height = 1500
totalElements = 2000

#setup bar class
class bar(object):
    def __init__(self, xpos, hgt):
        self.hgt = hgt
        self.xpos = xpos
        self.wdth = float(width)/totalElements
    def __str__(self):
        return 'Height '+str(self.hgt)+' at position: '+str(self.xpos)
    def show(self):
        fill(0)
        rect(self.xpos,height,self.wdth,-self.hgt)
    def getHeight(self):
        return self.hgt
    def getXpos(self):
        return self.xpos
    def setHeight(self, hgt):
        self.hgt = hgt
    def setXPos(self, xpos):
        self.xpos = xpos
    def swapHeights(self, otherBar):
        temp = self.hgt
        self.hgt = otherBar.getHeight()
        otherBar.setHeight(temp)
    def swapPos(self, otherBar):
        temp = self.xpos
        self.xpos = otherBar.getXpos()
        otherBar.setXpos(temp)

#initialize manual testing list:
# MASTER_LIST = []
# for i in range(len(MASTER_LIST):
#     bars.append(bar(float(width)/totalElements*i,RANDOM_LIST[i]))

#intitalize random testing list:
upperRange = height - 50
RANDOM_LIST = []
bars = []
for i in range(totalElements):
    RANDOM_LIST.append((int)(r.random()*upperRange))
    bars.append(bar(float(width)/totalElements*i,RANDOM_LIST[i]))
    
def showBars(bars):
    for bar in bars:
        bar.show()

def bubbleSort(bars):
    showBars(bars)
    for idx in range(1,len(bars)):
        if bars[idx-1].getHeight() < bars[idx].getHeight():
            swapped = True
            bars[idx-1].swapHeights(bars[idx])
   
current = 0     
def selectionSort(bars):
    global current
    showBars(bars)
    #sort
    sorted = False 
    if current >= len(bars):
        sorted = True
    if not sorted:
        minIdx = current
        minHeight = bars[current].getHeight()
        for idx in range(current,len(bars)):
            if bars[idx].getHeight() > minHeight:
                minHeight = bars[idx].getHeight()
                minIdx = idx
        bars[minIdx].swapHeights(bars[current])
        current+=1

def setup():
    size(width, height)
    frameRate(1000)
    noLoop()
    
def draw():
    background(255)
    selectionSort(bars)
    # bubbleSort(bars)
    loop()
