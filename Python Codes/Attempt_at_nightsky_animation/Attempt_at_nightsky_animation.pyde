x=0
r=150

def setup():
    size(r*4,r*4)

def draw():
    global x          #tells the code that we are going to use these variables here too
    global r
    background(0)     #makes the background "nighttime"
    
    x+=3                    #speed of the car
    fill(230,30,0)          #color of the car
    stroke(255)             #outline
    rect(x,525,125,50)           #body of the car
    fill(30)                     #black wheels
    ellipse(x,575,50,50)
    ellipse(125+x,575,50,50)
    
    fill(244, 208, 63)
    triangle(0,300,50,220,100,300)
    
    
