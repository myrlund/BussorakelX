//
//  AppController.m
//  BussorakelX
//
//  Created by Jonas Myrlund on 21.10.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (IBAction)ask:(id)sender {
	oracle = [[Oracle alloc] init];
	
	NSString *question = [inputField stringValue];
	NSString *response = [oracle ask:question];
	
	[responseField setStringValue:response];
}

@end
