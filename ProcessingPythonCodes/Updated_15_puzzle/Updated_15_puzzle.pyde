import random                      #tells the program that you will use random integers


r=150
CAP=['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15',' ']

def setup():
    scramble()
    size(r*4,r*4 + 200)                 #the plus 200 just adds the bottom part of the screen

def draw ():
    global r
    textSize(36)
    background(0,0,255)
    stroke(255)
    
    fill(230,253,123)
    rect(r,r*4 + 50, r*2, 100, 54)       #the last value, 54, adds curvature to the button
    
    fill(0,252,22)
    text('Scramble', r + 70, r*4 + 115)
    
    for row in range(4):                 #row starts at 0, row is the counter and goes til 4
        for col in range(4):
            fill(255,50,0)
            rect(r*col,r*row,r,r) 
            pos = 4*row+col                   #defines the position
            fill(0)
            text(CAP[pos],r*col+60,r*row+85)

def scramble():                          #scrambles the board (moves pieces 1000 times)
    for x in range(1000):                #the for loop is like the while loop just without the whole x+=1 everytime 
        row=random.randint(0,3)
        col=random.randint(0,3)
        check(row,col)
         
def swap(cp,np):
    CAP[np]=CAP[cp]
    CAP[cp]=' '
    
            
def check(row,col):
    pos = row*4 + col                           #translates our rows and columns into positions
    if col>0 and CAP[pos-1] == ' ':             #checking for blank on the right
        swap(pos, pos-1)
    if col<3 and CAP[pos+1] == ' ':
        swap(pos, pos+1)
    if row>0 and CAP[pos-4] == ' ':
        swap(pos,pos-4)
    if row<3 and CAP[pos+4] == ' ':
        swap(pos, pos+4)
            
def mousePressed():                           #before we do anything we need to make sure the input from the mouse is on the board
    if mouseX < r*4 and mouseY< r*4:          #checks to see that the mosue is on the board
        col = mouseX/r                        #here we are translating the click of our mouse as a row and column
        row = mouseY/r
        check(row,col)
    
    if r < mouseX < r*4 - 150 and r*4 + 150 > mouseY > r*4 + 50:     #scramble button at bottom of screen only works in the scramble button and not in the blue area... YAY!
        scramble()
        

        
    
    
