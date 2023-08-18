//
//  NCSongDetailInfo.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/15/23.
//

#import "NCSongDetailInfo.h"

@implementation NCSongDetailInfo

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
