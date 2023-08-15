//
//  NCSongDetailInfo.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/15/23.
//

#import "NCSongDetailInfo.h"

@implementation NCSongDetailArInfo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ar_id" : @"id"};
}

@end

@implementation NCSongDetailInfo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"song_id" : @"id",
             @"al_name" : @"al.name",
             @"picUrl" : @"al.picUrl",
             @"al_id" : @"al.id",
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"ar" : NCSongDetailArInfo.class};
}

@end
