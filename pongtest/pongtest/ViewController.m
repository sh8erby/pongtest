//
//  ViewController.m
//  pongtest
//
//  Created by Arnold Li on 2/17/14.
//  Copyright (c) 2014 Arnold Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    AnimatedBackground.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed: @"Menu01.png"],
                                          [UIImage imageNamed: @"Menu02.png"],
                                          [UIImage imageNamed: @"Menu03.png"],
                                          [UIImage imageNamed: @"Menu04.png"],
                                          [UIImage imageNamed: @"Menu05.png"], Nil
                                          ];
    [AnimatedBackground setAnimationRepeatCount: 0];
    AnimatedBackground.animationDuration = 5;
    [AnimatedBackground startAnimating];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
