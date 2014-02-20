//
//  ViewController.m
//  iWordStats
//
//  Created by Ryan Hoshor on 12/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Words.h"

@implementation ViewController

@synthesize label, console, activity;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.console.text = nil;
    [activity stopAnimating];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)processWords1 {
    NSDate *startDate = [NSDate date];
    Words *words = [[Words alloc] init];
    self.label.text = [NSString stringWithFormat:@"Finished. [Took %f seconds]", [[NSDate date] timeIntervalSinceDate: startDate]];
    self.console.text = words.text;
    [words release];
    [activity stopAnimating];
}

- (IBAction)processWords:(id)sender {
    self.console.text = nil;
    self.label.text = @"Starting...";
    [activity startAnimating];
    [self performSelector:@selector(processWords1) withObject:nil afterDelay:.01];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
