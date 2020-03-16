#import "T1Array.h"

@implementation T1Array

- (NSArray *)convertToHappy:(NSArray *)sadArray {
        if (sadArray.count == 0) {
            NSArray *happyArray = [[NSArray alloc] init];
            return happyArray;
        } else {
    
        NSMutableArray *happyArray = [[NSMutableArray alloc] init];
        [happyArray addObject: [sadArray firstObject]];
            for (NSUInteger i = 1; i < sadArray.count-1; i++) {
                int left = [[sadArray objectAtIndex:i-1] intValue];
                int central = [[sadArray objectAtIndex:i] intValue];
                int right = [[sadArray objectAtIndex:i+1] intValue];
                    if (central < (left + right)) {
                        [happyArray addObject: [sadArray objectAtIndex:i]];
                        for (NSUInteger i = 1; i < happyArray.count-1; i++) {
                            int left = [[happyArray objectAtIndex:i-1] intValue];
                            int central = [[happyArray objectAtIndex:i] intValue];
                            int right = [[happyArray objectAtIndex:i+1] intValue];
                            if (central > (left + right)) {
                                [happyArray removeObjectAtIndex:i];
                }
            }
        }
    }
            [happyArray addObject: [sadArray lastObject]];
            NSArray *happyArray_final = [[NSArray alloc] initWithArray:happyArray];
            return happyArray_final;
    }
}
    @end
    
