#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSMutableArray *twoEated = [[NSMutableArray alloc] initWithArray:bill];
    [twoEated removeObjectAtIndex:(NSUInteger)index];
    NSNumber *sumOnlyTwo = [twoEated valueForKeyPath:@"@sum.self"];
    int sumOnTwo = [sumOnlyTwo intValue] / 2;
    int giveSum = [sum intValue];
    if (giveSum <= sumOnTwo) {
        NSString *output = @"Bon Appetit";
        return output;
    } else {
        int shouldBePaid = giveSum - sumOnTwo;
        NSString *output = [NSString stringWithFormat:@"%d", shouldBePaid];
        return output;
    }
}

@end
