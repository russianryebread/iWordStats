//
//  Words.m
//  iWordStats
//
//  Created by Ryan Hoshor on 12/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Words.h"
#   define NSLog(fmt, ...)  {self.text = [NSString stringWithFormat:fmt, ##__VA_ARGS__];}

@implementation Words
@synthesize text;
- (id)init {
	NSDate* startDate = [NSDate date];
	NSLog(@"* * * * * * * * * * * * Word Stats v01 * * * * * * * * * * * * *\r\n");
	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"txt"];
    NSString *stringFromFileAtPath = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *words = [stringFromFileAtPath componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    NSString *longestWord = @"";
    NSString *shortestWord = @"";
    NSUInteger totalChars = 0;
    NSUInteger wordCount = [words count]-1; // -1 for blank line at the end...
    
    int i;
    for (i=0; i < wordCount; ++i) {
        NSString *currWord = [[NSString alloc] initWithString:[words objectAtIndex:i]];
        
        // Calculate the total chars processed.
        totalChars += [currWord length];
        
        // Store value for the longest & shortest words
        if ([currWord length] >= [longestWord length])
            longestWord = currWord;
        
        if ([currWord length] <= 1)
            shortestWord = currWord;
        
        [currWord release];
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:kCFNumberFormatterDecimalStyle];
    
    NSLog(@"       Number of words: %lu", (unsigned long)wordCount);
    NSLog(@"    Shortest Word [%2d]: %@", [shortestWord length], shortestWord);
    NSLog(@"     Longest Word [%2d]: %@", [longestWord length], longestWord);
    NSLog(@"      Total Characters: %@", [formatter stringFromNumber:[NSNumber numberWithInteger:totalChars]]);
    NSLog(@"Total Bits [chars x 8]: %@", [formatter stringFromNumber:[NSNumber numberWithInteger:totalChars*8]]);
    NSLog(@"================================================================");
    
    NSMutableArray *wordStats = [[NSMutableArray alloc] init];
    for (i=0; i < [longestWord length]; ++i) {
        
        NSMutableArray *tmp = [[NSMutableArray alloc] init];
        
        int j;
        for (j=0; j<wordCount; ++j)
            if ([[words objectAtIndex:j] length] == i)
                [tmp addObject:[words objectAtIndex:j]];
        
        [wordStats addObject:tmp];
        [tmp release];
        
        // Make it pretty. :)
        char *f = (i > 1) ? "s" : " ";
        if (i >= 1)
            NSLog(@"Number of words %2d character%s long: %lu", i, f, (unsigned long)[[wordStats objectAtIndex:i] count]);
    }
    
    // Time Log
    NSString *time = [NSString stringWithFormat:@"Process Took: %f seconds.\r\n", [[NSDate date] timeIntervalSinceDate: startDate]];
    NSLog(@"================================================================");
    NSLog(@"%@", time);
    
    [wordStats release];
    
    return self;
}

- (void)setText:(NSString*)string {
    if (string != text) {
        if ([text length]){
            text = [text stringByAppendingString:string];
            text = [text stringByAppendingString:@"\r\n"];
        }else{
            text = [NSString stringWithString:string];
        }
    }
}

@end
