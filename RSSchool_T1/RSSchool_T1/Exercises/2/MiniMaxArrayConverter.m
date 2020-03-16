#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSMutableArray <NSNumber*>* fiveSums = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < array.count; i++) {
        NSMutableArray *fourNumb = [[NSMutableArray alloc] initWithArray:array];
        [fourNumb removeObjectAtIndex:i];

        int sumOfFour = 0;
        for (NSUInteger i = 0; i < fourNumb.count; i++) {
            int element = [[fourNumb objectAtIndex:i] intValue];
            sumOfFour += element;
        }
        NSNumber* sum = [[NSNumber alloc] initWithInt:sumOfFour];
        [fiveSums addObject:sum];
    }
    NSNumber* max = [fiveSums valueForKeyPath:@"@max.intValue"];
    NSNumber* min = [fiveSums valueForKeyPath:@"@min.intValue"];
    NSArray <NSNumber*>* miniMaxArray = [[NSArray alloc] initWithObjects:min, max, nil];
     
    return miniMaxArray;
}

@end
