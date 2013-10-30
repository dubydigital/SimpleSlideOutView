//
//  ViewController.h
//  SlideOutCustom
//
//  Created by Mark Dubouzet on 10/30/12.
//  Copyright (c) 2012 Mark Dubouzet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>{
    UIPanGestureRecognizer *panGesture;
}

@property (nonatomic ,retain)  UIPanGestureRecognizer *panGesture;

@end
