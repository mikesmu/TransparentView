//
//  ViewController.m
//  ResponderTest
//
//  Created by Michał Smulski on 01.03.2013.
//  Copyright (c) 2013 TAP. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "TransparentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	TransparentView *view = [TransparentView new];
	view.frame = CGRectMake(20.0, 20.0, 100.0, 100.0);
	view.backgroundColor = [UIColor greenColor];
	[view setUserInteractionEnabled:YES];
	view.center = self.view.center;
	//	view.ignoreTouches = YES;
	[self.view addSubview:view];
	{
		UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:view
																			  action:@selector(didTap:)];
		
		[view addGestureRecognizer:tap];
	}
	{
		UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
																			  action:@selector(didTap:)];
		
		[self.view addGestureRecognizer:tap];
	}
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"Tap" forState:UIControlStateNormal];
	[button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
	[button setBackgroundColor:[UIColor whiteColor]];
	[button sizeToFit];
	button.center = CGPointMake(CGRectGetWidth(view.frame)/2,
								CGRectGetHeight(view.frame)/2);
	[button addTarget:self
			   action:@selector(testButtonPushed:)
	 forControlEvents:UIControlEventTouchUpInside];
	[view addSubview:button];
}

- (void)didTap:(UITapGestureRecognizer*)tap {
	NSLog(@"touch inside self.view");
}

- (void)testButtonPushed:(UIButton*)button {
	NSLog(@"button inside transparent view pushed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
