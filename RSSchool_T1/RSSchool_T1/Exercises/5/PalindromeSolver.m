#import "PalindromeSolver.h"

@implementation PalindromeSolver

- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSMutableArray *tempDataArray = [[NSMutableArray alloc] init];
    NSInteger numberOfDigits = [n integerValue];
    NSInteger maxAllowedChanges = [k integerValue];
    NSInteger maxValue = 0;
    NSInteger factChanges = 0;
  
    [s enumerateSubstringsInRange:(NSRange){0, [s length]}
                          options: NSStringEnumerationByComposedCharacterSequences
                       usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [tempDataArray addObject:substring];
    }];
    
    for (long leftDigit = 0, rightDigit = numberOfDigits-1; leftDigit < numberOfDigits/2; leftDigit++, rightDigit--) {
        NSInteger valueofLeftDidit = [[tempDataArray objectAtIndex:leftDigit] integerValue];
        NSInteger valueOfRightDigit = [[tempDataArray objectAtIndex:rightDigit] integerValue];
        NSInteger biggerValue = MAX(valueofLeftDidit, valueOfRightDigit);
        if (valueofLeftDidit != valueOfRightDigit) {
            if (maxValue < biggerValue) {
                maxValue = biggerValue;
            }
                factChanges++;
        }
    }
        
    if (factChanges > maxAllowedChanges) {
        return @"-1";
    }
    
    for (long left = 0, right = numberOfDigits-1; left < numberOfDigits/2; left++, right--) {
        if (([[tempDataArray objectAtIndex:left] integerValue] != [[tempDataArray objectAtIndex:right] integerValue]) && maxAllowedChanges > 0) {
            tempDataArray[right] = [NSNumber numberWithInteger:maxValue];
            tempDataArray[left] = [NSNumber numberWithInteger:maxValue];
            maxAllowedChanges --;
        }
    }
    
    NSString *highestValuePalindrome = [tempDataArray componentsJoinedByString:@""];
    return highestValuePalindrome;
}

@end
