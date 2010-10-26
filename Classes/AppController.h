//
//  AppController.h
//  BussorakelX
//
//  Created by Jonas Myrlund on 21.10.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Oracle.h"

@interface AppController : NSObject {
	IBOutlet NSTextField *inputField;
	IBOutlet NSTextField *responseField;
	
	Oracle *oracle;
}

- (IBAction)ask:(id)sender;

@end
