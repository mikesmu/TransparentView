//
//  TransparentView.m
//  ResponderTest
//
//  Created by Michał Smulski on 01.03.2013.
//  Copyright (c) 2013 TAP. All rights reserved.
//

#import "TransparentView.h"

@implementation TransparentView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	if ([self pointInside:point withEvent:event]) {
		UIView *superview = [super hitTest:point withEvent:event];
		// pass touch event on self to next responder
		if (self.ignoreTouches && superview == self) {
			return (UIView*)[self nextResponder];
		} else {
			// else perform standard action
			return superview;
		}
	} else {
		// should do nothing since touch is outside view
		return nil;
	}
}

- (void)didTap:(UITapGestureRecognizer*)tap {
	NSLog(@"touch inside transparent view");
}

@end
