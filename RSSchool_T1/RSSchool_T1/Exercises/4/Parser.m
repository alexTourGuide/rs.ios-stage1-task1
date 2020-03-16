#import "Parser.h"

@implementation Parser

- (NSArray <NSString*>*)parseString:(NSString*)string {
    unichar beginBrackets[] = { '<', '(', '[' };
    unichar endBrackets[] = { '>', ')', ']' };
    NSMutableArray <NSString*> *finalArray = [[NSMutableArray alloc] init];
    
    NSUInteger len = string.length;
    unichar buffer[len + 1];
    [string getCharacters:buffer range:NSMakeRange(0, len)];
    NSMutableOrderedSet<NSValue *> *results = [NSMutableOrderedSet orderedSet];
    NSInteger depth = 0;
    
    for (int string = 0; string < len; string++){
        for(int bracket = 0; bracket < 3; bracket++){
            if (buffer[string] == beginBrackets[bracket]){
                for (int i = string + 1; i < len ; i++) {
                    if (buffer[i] == beginBrackets[bracket]) {
                        depth++; continue;
                    }
                    if (buffer[i] == endBrackets[bracket] && depth != 0) {
                        depth--; continue;
                    }
                    if (buffer[i] == endBrackets[bracket] && depth == 0) {
                        [results addObject:[NSValue valueWithRange:NSMakeRange(string + 1, i - string - 1)]]; break;
                        }
                    }
                }
            }
        }

    for (NSUInteger i = 0; i < [results count]; i++) {
        NSValue *value = [results objectAtIndex:i];
        NSRange range = [value rangeValue];
        NSString *subString = [string substringWithRange:range];
        [finalArray addObject:subString];
    }
    return finalArray;
}

@end
