//
//  NCAlbumInfo.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import "NCAlbumInfo.h"

@implementation NCAlbumInfo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"name",
             @"picUrl" : @"picUrl",
             @"al_id" : @"id",
    };
}

@end
