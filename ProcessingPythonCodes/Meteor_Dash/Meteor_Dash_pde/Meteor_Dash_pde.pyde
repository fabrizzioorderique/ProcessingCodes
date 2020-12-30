'''
METEOR DASH - the game
Written by: Piero Orderique
24 December 2020
'''
###################################################################
class Particle(object):
    def __init__(self):
        self.radius = random(10, 25)
        self.velocity = random(1, 10)
        self.x = random(0, width)
        self.y = random(0, height)
    
    def update(self):
        self.y += self.velocity 
        self.y %= height
        
    def show(self):
        fill(250, 255, 0)
        ellipseMode(CENTER)
        ellipse(self.x, self.y, self.radius, self.radius)
        
###################################################################
class Particles(object):
    def __init__(self, quantity=10):
        self.quantity = quantity
        self.particles = [Particle() for i in range(quantity)]
    
    def update(self): 
        for particle in self.particles: particle.update()
        
    def show(self): 
        for particle in self.particles: particle.show()
        
###################################################################
class Meteor(object):
    def __init__(self):
        buffer_x = 50
        buffer_y = 100
        self.radius = random(buffer_x, buffer_x+50)
        self.xvel = random(-2, 2)
        self.yvel = random(5, 12)
        self.x = random(buffer_x, width-buffer_x)
        self.y = random(buffer_y, height-buffer_y)
        
    def update(self):
        self.x += self.xvel 
        self.x %= width
        self.y += self.yvel 
        self.y %= height
        
    def show(self):
        fill(165, 115, 0)
        ellipseMode(CENTER)
        ellipse(self.x, self.y, self.radius, self.radius)
        
###################################################################
class Meteors(object):
    # helps with "level intensity"
    timer = 1
    threshold = 607 #6007 # nice large prime. with 60fps, level difficulty increases roughly every 100 seconds
    
    def __init__(self, quantity=3):
        self.quantity = quantity
        self.meteors = [Meteor() for i in range(quantity)]
    
    def update(self): 
        if self.timer % self.threshold == 0: self.meteors.append(Meteor())
        for meteor in self.meteors: meteor.update()
        self.timer += 1
        
    def show(self): 
        for meteor in self.meteors: meteor.show()
###################################################################
class TitleScreen(object):
    # these help display the rocket as "bouncing" on the title screen
    timer = 0
    rocket_up = False
    
    def __init__(self):
        # load images
        self.logo = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\Meteor_Dash_Logo.jpg")
        self.play_sign = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\playsign.jpg")
        self.play_button_on = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\play_button_on.jpg")
        self.play_button_off = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\play_button_off.jpg")
        self.rocket = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\rocket.png")
        
        # resize images
        self.play_button_on.resize(320,300)
        self.play_button_off.resize(330,300)
        
        # initialize background particles
        self.particles = Particles(70)
        
    def display(self):
        '''displays title screen features'''
        
        # displays the particles
        self._display_particles()
        
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
        
    def _display_particles(self):
        self.particles.show()
        self.particles.update()
        
    def over_button(self):
        '''returns True if mouse is over button'''
        return mouseX > self.bx and mouseX < (self.bx + self.play_button_on.width) and mouseY > self.by  and mouseY < (self.by + self.play_button_on.height)
        
    def _central_x(self, img):
        '''returns x coordinate need to centralize image on the x axis'''
        return width/2 - img.width/2
    
###################################################################
class GameScreen(object):
    def __init__(self):
        # load images
        self.rocket = loadImage(r"C:\Users\fabri\OneDrive\Documents\Programming\Processing\ProcessingPythonCodes\Meteor_Dash\Meteor_Dash_pde\data\rocket.png")
        
        # resize images 
        self.rocket.resize(200,300)
        
        # initialize background particles and meteors
        self.particles = Particles(70)
        self.meteors = Meteors()
    
    def display(self):
        # displays the particles and meteors
        self._display_particles()
        self._display_meteors()
        
        rocket_x = mouseX - self.rocket.width/2
        rocket_y = mouseY - self.rocket.height/2
        image(self.rocket, rocket_x, rocket_y)
        
    def _display_particles(self):
        self.particles.show()
        self.particles.update()
        
    def _display_meteors(self):
        self.meteors.show()
        self.meteors.update()

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
    global showTitleScreen, gameStarted
    
    background(0)
    if showTitleScreen: title_screen.display()
    if gameStarted: game_screen.display()
    
    loop()
    
def mouseClicked():
    global showTitleScreen, gameStarted
    if showTitleScreen and title_screen.over_button(): showTitleScreen, gameStarted = False, True
