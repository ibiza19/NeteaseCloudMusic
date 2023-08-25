//
//  NCAlbumInfo.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import "NCAlbumInfo.h"

@implementation NCAlbumInfo

#pragma mark - NSSecureCoding

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.al_id = ((NSNumber *)[coder decodeObjectForKey:@"al_id"]).integerValue;
        self.picUrl = [coder decodeObjectForKey:@"picUrl"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:@(self.al_id) forKey:@"al_id"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

#pragma mark - YYModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"name",
             @"picUrl" : @"picUrl",
             @"al_id" : @"id",
    };
}

@end
