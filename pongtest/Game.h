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

int ComputerScoreNumber;
int PlayerScoreNumber;


@interface Game : UIViewController
{
    IBOutlet UIImageView *Ball;
    IBOutlet UIButton *StartButton;
    
    //added player and computer once the image was added
    IBOutlet UIImageView *Player;
    IBOutlet UIImageView *Computer;
    
    IBOutlet UILabel *PlayerScore;
    IBOutlet UILabel    *ComputerScore;
    IBOutlet UILabel *WinorLose;
    IBOutlet UILabel   *Exit;
    
    NSTimer * timer;
}

-(IBAction)StartButton:(id)sender;
-(void)BallMovement;
//part 2 added computer movement into game.m
-(void)ComputerMovement;
//part 3 collision detection
-(void)Collission;

@end
