//
//  NCSongInfo.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import "NCSongInfo.h"

@implementation NCSongInfo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"song_id" : @"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"artists" : NCArtistInfo.class};
}

@end
