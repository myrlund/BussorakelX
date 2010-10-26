//
//  Oracle.m
//  BussorakelX
//
//  Created by Jonas Myrlund on 21.10.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Oracle.h"
#import "ASIFormDataRequest.h"

@implementation Oracle

- (id)init {
	defaultResponse = @"Bussorakelet sover.";
	url = @"http://www.idi.ntnu.no/~tagore/cgi-bin/busstuc/busq.cgi";
	queryParam = @"quest";
	langParam = @"lang";
	return [super init];
}

- (NSString *)ask:(NSString *)question {
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
	[request addPostValue:question forKey:queryParam];
	[request addPostValue:@"eng" forKey:langParam];
	
	// Perform the request
	[request startSynchronous];
	
	// Handle the result
	NSString *rawAnswer = [request responseString];
	NSString *bodyContents = [self getBodyContents:rawAnswer];
	return [self formatHTML:bodyContents];
}

- (NSString *)formatHTML:(NSString *)html {
	NSScanner *scanner = [NSScanner scannerWithString:html];
	
	NSMutableString *result = [[NSMutableString alloc] init];
	while (![scanner isAtEnd]) {
		NSString *s;
		[scanner scanUpToString:@"<br>" intoString:&s];
		[scanner setScanLocation:[scanner scanLocation] + 4];
		
		[result appendString:s];
		[result appendString:@"\n"];
	}
	
	return result;
}

- (NSString *)getBodyContents:(NSString *)html {
	NSScanner *scanner = [NSScanner scannerWithString:html];
	
	NSString *bodyTag = @"<body>";
	[scanner scanUpToString:bodyTag intoString:NULL];
	[scanner setScanLocation:[scanner scanLocation] + [bodyTag length]];
	
	NSString *bodyContents;
	[scanner scanUpToString:@"</body>" intoString:&bodyContents];
	
	return bodyContents;
}

@end
