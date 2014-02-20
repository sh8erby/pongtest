//
//  Game.m
//  pongtest
//
//  Created by Arnold Li on 2/18/14.
//  Copyright (c) 2014 Arnold Li. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)Collission{
 
    //if the ball touches the player panel
    if (CGRectIntersectsRect(Ball.frame, Player.frame)){
        y =arc4random()%5;
        y = 0-y;
    }
    
    if (CGRectIntersectsRect(Ball.frame, Computer.frame)) {
        y = arc4random()%5;
        //y = 0-y;
    }
}

//this will implemtent the dragging on our paddle
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *Drag = [[event allTouches] anyObject];
    Player.center = [Drag locationInView:self.view];
    
    //locking the .y on our paddle at 525, cannot be higher or lower than 525
    if (Player.center.y > 536)
        Player.center = CGPointMake(Player.center.x, 525);
    
    if (Player.center.y < 536)
        Player.center = CGPointMake(Player.center.x, 525);
    
    //lock the player from moving from the sides of the screen
    if (Player.center.x < 0)
        Player.center = CGPointMake(0, Player.center.y);
    
    if (Player.center.x > 246)
        Player.center = CGPointMake(246, Player.center.y);
        
}

-(void)ComputerMovement{
    
    //if the ball is left of the computer, the computer moves left
    //if right, moves right
    
    if (Computer.center.x > Ball.center.x){
        Computer.center = CGPointMake(Computer.center.x - 2, Computer.center.y);
    }
    if(Computer.center.x < Ball.center.x)
    {
        Computer.center = CGPointMake(Computer.center.x + 2, Computer.center.y);
    }
    
    //this will keep the computer not move out of the screen
    if(Computer.center.x < 0)
        Computer.center = CGPointMake(0, Computer.center.y);
    
    if(Computer.center.x > 320)
        Computer.center = CGPointMake(246, Computer.center.y);
    
}


//this was made
-(IBAction)StartButton:(id)sender{
    
    //hides the button when it is hit
    StartButton.hidden = YES;
    Exit.hidden = YES;

    //this first moves the ball in a random direction in any point of the screen
    //random number generator between 0 and 10, then taking 5 away from it. from -5 to 5
    //either goes up or down
    y = arc4random() %11;
    y = y-5;
    
    x = arc4random() %11;
    x = x-5;
    
    if (y == 0)
        y = 1;
    if (x == 0)
        x = 1;
    
    //this time will move the ball
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BallMovement) userInfo:nil repeats:YES];
}
//this was made
-(void) BallMovement{
    
    //
    [self Collission];
    
    //this will run the computer movement ever 0.01 second
    [self ComputerMovement];
    
    
    //moves the ball every 0.01 second
    Ball.center = CGPointMake(Ball.center.x + x, Ball.center.y + y);
    
    
    //if the ball touches the screen, bounce of the screen
    //it is 15, because the ball is size 30, half the size is 15 (left hand side of the screen)
    //the screen is 320 pixels horiz. so the 320 -15 = 305 (right hand side of the screen)
    if(Ball.center.x < 15)
        x = 0 - x;
    if(Ball.center.x > 305)
        x = 0 - x;
    
    /*
    if(Ball.center.y < 15)
        y = 0-y;
    if(Ball.center.y > 553)
        y = 0-y;
    */
    //to check when the ball has scored
    if (Ball.center.y < 0) {
        PlayerScoreNumber = PlayerScoreNumber + 1;
        PlayerScore.text = [NSString stringWithFormat:@"%i", PlayerScoreNumber ];
        
        //stops the ball and move it back to starting position
        [timer invalidate];
        StartButton.hidden = NO;
        Ball.center = CGPointMake(145, 258);
        
        //resets the computer back to the middle
        Computer.center = CGPointMake(123, 20  );
        
        if (PlayerScoreNumber == 10)
        {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinorLose.hidden = NO;
            WinorLose.text = [NSString stringWithFormat:@"You Win!"];
        }
            
    }
    
    if (Ball.center.y > 580) {
        ComputerScoreNumber = ComputerScoreNumber + 1;
        ComputerScore.text = [NSString stringWithFormat:@"%i", ComputerScoreNumber];
        [timer invalidate];
        StartButton.hidden = NO;
        Ball.center = CGPointMake(145, 258);
        
        Computer.center = CGPointMake(123, 20  );
        
        if (ComputerScoreNumber == 10)
        {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinorLose.hidden = NO;
            WinorLose.text = [NSString stringWithFormat:@"You Lose!"];
        }
    }
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    PlayerScoreNumber = 0;
    ComputerScore = 0;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
