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

//this was made
-(IBAction)StartButton:(id)sender{

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
    
    //moves the ball every 0.01 second
    Ball.center = CGPointMake(Ball.center.x + x, Ball.center.y + y);
    
    
    //if the ball touches the screen, bounce of the screen
    //it is 15, because the ball is size 30, half the size is 15 (left hand side of the screen)
    //the screen is 320 pixels horiz. so the 320 -15 = 305 (right hand side of the screen)
    if(Ball.center.x < 15)
        x = 0 - x;
    if(Ball.center.x > 305)
        x = 0 - x;
    
    if(Ball.center.y < 15)
        y = 0-y;
    if(Ball.center.y > 553)
        y = 0-y;
    
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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
