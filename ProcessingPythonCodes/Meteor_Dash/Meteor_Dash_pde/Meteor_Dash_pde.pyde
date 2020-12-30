'''
METEOR DASH - the game
Written by: Piero Orderique
24 December 2020
'''
class TitleScreen(object):
    # these help display the rocket as "bouncing" on the title screen
    timer = 0
    rocket_up = False
    
    def __init__(self):
        self.logo = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\Meteor_Dash_Logo.jpg")
        self.play_sign = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\playsign.jpg")
        self.play_button_on = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\play_button_on.jpg")
        self.play_button_off = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\play_button_off.jpg")
        self.play_button_on.resize(320,300)
        self.play_button_off.resize(330,300)
        self.rocket = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\rocket.png")
        
    def display(self):
        '''displays title screen features'''
        # controls rocket "bounce"
        if self.timer % 15 == 0: self.rocket_up = not self.rocket_up 
        if self.rocket_up: rocket_bounce = 15
        else: rocket_bounce = 0
        
        # mess around with heights 
        logo_height = height*1/10
        play_sign_height = logo_height + self.logo.height + 150
        self.bx = self._central_x(self.play_button_on)
        self.by = play_sign_height + self.play_sign.height + 50    # we need bx and by for mouse clicked func
        rocket_height = height*7/8-self.rocket.width-rocket_bounce
        
        # displays logo, play sign, and bouncing rocket
        image(self.logo, self._central_x(self.logo), logo_height) 
        image(self.play_sign, self._central_x(self.play_sign), play_sign_height)
        image(self.rocket, self._central_x(self.rocket), rocket_height)
        
        # displays approproate button image
        if self.over_button(): button_img = self.play_button_off
        else: button_img = self.play_button_on
        image(button_img, self.bx, self.by)
        
        # controls for bouncing rocket update
        self.timer += 1
        
    def over_button(self):
        '''returns True if mouse is over button'''
        return mouseX > self.bx and mouseX < (self.bx + self.play_button_on.width) and mouseY > self.by  and mouseY < (self.by + self.play_button_on.height)
        
    def _central_x(self, img):
        '''returns x coordinate need to centralize image on the x axis'''
        return width/2 - img.width/2
###################################################################
class GameScreen(object):
    def __init__(self):
        self.rocket = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\rocket.png")
    
    def update(self):
        pass

###################################################################
# initialize game variables
width = 1350
height = 1800

showTitleScreen = True
title_screen = TitleScreen()

gameStarted = False
game_screen = GameScreen()


def setup():
    size(width, height)
    frameRate(60)
    noLoop()
    
def draw():
    global showTitleScreen
    
    background(0)
    if showTitleScreen: title_screen.display()
    loop()
    
def mouseClicked():
    global showTitleScreen, gameStarted
    if showTitleScreen and title_screen.over_button(): showTitleScreen, gameStarted = False, True
    
def keyPressed():
    pass
