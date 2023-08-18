//
//  NCAlbumInfo.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NCAlbumInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, assign) NSInteger al_id;

@end

NS_ASSUME_NONNULL_END
