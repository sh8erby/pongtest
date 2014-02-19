//
//  Game.h
//  pongtest
//
//  Created by Arnold Li on 2/18/14.
//  Copyright (c) 2014 Arnold Li. All rights reserved.
//

#import <UIKit/UIKit.h>

//declare 2 integers
int x;
int y;

@interface Game : UIViewController
{
    IBOutlet UIImageView *Ball;
    IBOutlet UIButton *StartButton;
    
    NSTimer * timer;
}

-(IBAction)StartButton:(id)sender;
-(void)BallMovement;



@end
