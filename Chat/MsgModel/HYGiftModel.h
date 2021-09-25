//
//  HYGiftModel.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYGiftModel : NSObject
@property (nonatomic, copy) NSString *giftID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *thumbnailUrl;

@end

NS_ASSUME_NONNULL_END
