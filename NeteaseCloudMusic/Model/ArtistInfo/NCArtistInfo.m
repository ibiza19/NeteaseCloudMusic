//
//  NCArtistInfo.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import "NCArtistInfo.h"

@implementation NCArtistInfo

#pragma mark - NSSecureCoding

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.ar_id = ((NSNumber *)[coder decodeObjectForKey:@"ar_id"]).integerValue;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:@(self.ar_id) forKey:@"ar_id"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

#pragma mark - YYModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ar_id" : @"id"};
}

@end
