'''
METEOR DASH - the game
Written by: Piero Orderique
24 December 2020
'''
class TitleScreen(object):
    # these help display the rocket as "boundcing" on the title screen
    timer = 0
    rocket_up = False
    
    def __init__(self):
        self.logo = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\Meteor_Dash_Logo.jpg")
        self.play_sign = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\playsign.jpg")
        self.play_button = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\play_button.jpg")
        self.rocket = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\rocket.png")
        
    def display(self):
        # controls rocket "bounce"
        if self.timer % 15 == 0: self.rocket_up = not self.rocket_up 
        if self.rocket_up: rocket_bounce = 15
        else: rocket_bounce = 0
        
        # displays logo, play button, and bouncing rocket
        image(self.logo, width/2-self.logo.width/2, height*1/8) # display title logo
        image(self.rocket, width/2-self.rocket.width/2, height*7/8-self.rocket.width-rocket_bounce)
        
        # 
        self.timer += 1
###################################################################
# initialize game variables
width = 1350
height = 1800
showTitleScreen = True
title_screen = TitleScreen()
gameStarted = False


def setup():
    size(width, height)
    frameRate(60)
    noLoop()
    
def draw():
    background(0) # dark space
    if showTitleScreen:
        title_screen.display()
    loop()
