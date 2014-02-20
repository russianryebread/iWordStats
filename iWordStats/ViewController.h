//
//  ViewController.h
//  iWordStats
//
//  Created by Ryan Hoshor on 12/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UITextView *console;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;


- (IBAction)processWords:(id)sender;
- (void)processWords1;
@end
