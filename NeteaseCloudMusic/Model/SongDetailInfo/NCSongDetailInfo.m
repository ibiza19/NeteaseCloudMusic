//
//  NCSongDetailInfo.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/15/23.
//

#import "NCSongDetailInfo.h"

@implementation NCSongDetailInfo

#pragma mark - NSSecureCoding

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.song_id = ((NSNumber *)[coder decodeObjectForKey:@"song_id"]).integerValue;
        self.album = [coder decodeObjectForKey:@"album"];
        self.artists = [coder decodeObjectForKey:@"artists"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:@(self.song_id) forKey:@"song_id"];
    [coder encodeObject:self.album forKey:@"album"];
    [coder encodeObject:self.artists forKey:@"artists"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

#pragma mark - YYModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"song_id" : @"id",
             @"album" : @"al",
             @"artists" : @"ar"
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"artists" : NCArtistInfo.class};
}

@end
