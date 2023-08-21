//
//  NCListManagerIndexUtils.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/21/23.
//

#import "NCListManagerIndexUtils.h"

@interface NCListManagerIndexUtils ()

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSArray<NSNumber *> *indexArray;

@end

@implementation NCListManagerIndexUtils

#pragma - Public Method
- (void)refreshRepeatWithSize:(NSInteger)size index:(NSInteger)realIndex {
    NSMutableArray *mutableArray = @[].mutableCopy;
    for (int i = 0; i < size; i++) {
        mutableArray[i] = @(i);
    }
    self.indexArray = mutableArray.copy;
    self.index = realIndex;
}

- (void)refreshShuffleWithSize:(NSInteger)size index:(NSInteger)realIndex {
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
    self.index = [self.indexArray indexOfObject:@(realIndex)];
}

- (NSInteger)previousIndex {
    self.index = (self.index == 0) ? self.indexArray.count - 1 : self.index - 1;
    return self.indexArray[self.index].integerValue;
}

- (NSInteger)nextIndex {
    self.index = (self.index + 1) % self.indexArray.count;
    return self.indexArray[self.index].integerValue;
}

- (void)refreshIndex:(NSInteger)realIndex {
    self.index = [self.indexArray indexOfObject:@(realIndex)];
}

@end
