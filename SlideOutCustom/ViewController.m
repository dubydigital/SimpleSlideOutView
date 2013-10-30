//
//  ViewController.m
//  SlideOutCustom
//
//  Created by Mark Dubouzet on 10/30/12.
//  Copyright (c) 2012 Mark Dubouzet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize panGesture;

- (void)viewDidLoad
{
    [super viewDidLoad];
     panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureMoveAround:)];
	// Do any additional setup after loading the view, typically from a nib.
    [panGesture setMaximumNumberOfTouches:2];
    [panGesture setDelegate:self];
    [self.view addGestureRecognizer:panGesture];

    
    UILabel * textLabel =[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - (200/2), self.view.frame.size.height/2 - (40/2), 200, 40)];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    [textLabel setBackgroundColor:[UIColor clearColor]];
    [textLabel setText:@"Swipe to reveal --->"];
    [self.view addSubview:textLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)panGestureMoveAround:(UIPanGestureRecognizer *)gesture;
{
    UIView *piece = [self view];

    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:[piece superview]];
        float adjustedXpos = [piece center].x + translation.x;
        
        if (adjustedXpos < 160) {
            adjustedXpos =160;
        }
        
        if (adjustedXpos > 427) {
            adjustedXpos = 427;
        }
        
        // I edited this line so that the image view cannont move vertically
        [piece setCenter:CGPointMake(adjustedXpos, [piece center].y)];
        [gesture setTranslation:CGPointZero inView:[piece superview]];
    }
    
    
    else if ([gesture state] == UIGestureRecognizerStateEnded){
        NSLog(@"END");
        
        if ([self.view center].x < 320) {           
            [UIView animateWithDuration: .2 delay: 0 options: 0 animations: ^(void)
              {
                  [piece setCenter:CGPointMake(160, [piece center].y)];
              } completion: ^(BOOL finished){
                             }];
        }else{
            
            [UIView animateWithDuration: .2 delay: 0 options: 0 animations: ^(void)
             {
                 [piece setCenter:CGPointMake(427, [piece center].y)];
             } completion: ^(BOOL finished){
             }];
        }
        
    }
}

@end
