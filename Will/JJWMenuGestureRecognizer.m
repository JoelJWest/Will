//
//  JJWMenuGestureRecognizer.m
//  Will
//
//  Created by Joel J. West on 2/9/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWMenuGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface JJWMenuGestureRecognizer()<UIGestureRecognizerDelegate>
@property (nonatomic) CGPoint firstTouch;
@end

@implementation JJWMenuGestureRecognizer


- (void)reset
{
    [super reset];
    
    self.delegate = self;
    self.state = UIGestureRecognizerStatePossible;
    self.firstTouch = CGPointMake(0, 0);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if (touches.count > 1)
    {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint localTouchLocation = [touch locationInView:self.view];
    
    if (localTouchLocation.x > 100){
        
        self.state = UIGestureRecognizerStateCancelled;
    }
    else{
        
        self.firstTouch = localTouchLocation;
        self.state = UIGestureRecognizerStateBegan;
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint localTouchLocation = [touch locationInView:self.view];
    
    if (abs(localTouchLocation.y - self.firstTouch.y) > 30){
        self.state = UIGestureRecognizerStateEnded;
  
    }
    if (abs(localTouchLocation.x - self.firstTouch.x) > 5){
     
        self.state = UIGestureRecognizerStateChanged;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.state = UIGestureRecognizerStateEnded;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

@end
