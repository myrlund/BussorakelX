//
//  Oracle.h
//  BussorakelX
//
//  Created by Jonas Myrlund on 21.10.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Oracle : NSObject {
	NSString *defaultResponse, *url, *queryParam, *langParam;
}

- (NSString *)ask:(NSString *)question;
- (NSString *)formatHTML:(NSString *)html;
- (NSString *)getBodyContents:(NSString *)html;

@end
