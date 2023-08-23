//
//  NCListManagerIndexUtils.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/21/23.
//

#import "NCListManagerIndexUtils.h"

@interface NCListManagerIndexUtils ()

@property (nonatomic, strong) NSArray<NSNumber *> *indexArray;

@end

@implementation NCListManagerIndexUtils

#pragma - Public Method
- (void)refreshRepeatWithSize:(NSInteger)size {
    NSMutableArray *mutableArray = @[].mutableCopy;
    for (int i = 0; i < size; i++) {
        mutableArray[i] = @(i);
    }
    self.indexArray = mutableArray.copy;
}

- (void)refreshShuffleWithSize:(NSInteger)size {
    NSMutableArray *mutableArray = @[].mutableCopy;
    for (int i = 0; i < size; i++) {
        mutableArray[i] = @(i);
    }
    
    // Fisher-Yates 洗牌算法
    for (NSInteger i = size - 1; i > 0; i--) {
        int j = arc4random_uniform((u_int32_t)(i + 1));
        [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    self.indexArray = mutableArray.copy;
}

- (NSInteger)previousWithIndex:(NSInteger)realIndex {
    NSInteger index = [self.indexArray indexOfObject:@(realIndex)];
    index = (index == 0) ? self.indexArray.count - 1 : index - 1;
    return self.indexArray[index].integerValue;
}

- (NSInteger)nextIndexWithIndex:(NSInteger)realIndex {
    NSInteger index = [self.indexArray indexOfObject:@(realIndex)];
    index = (index + 1) % self.indexArray.count;
    return self.indexArray[index].integerValue;
}

@end
