//
//  HYMsgModel.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <Foundation/Foundation.h>
#import "HYUserModel.h"
#import "HYGiftModel.h"
#import "HYMsgAttributeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYMsgModel : NSObject

@property (nonatomic, assign) NDSubMsgType subType;

@property (nonatomic, strong) HYUserModel *user;
/// 直播间文本内容
@property (nonatomic, copy) NSString *content;
// 礼物数量
@property (nonatomic, copy) NSString *quantity;
@property (nonatomic, copy) NSString *msgID;
/// 被@的用户
@property (nonatomic, strong) HYUserModel *atUser;

@property (nonatomic, strong) HYGiftModel *giftModel;

@property (nonatomic, strong) HYMsgAttributeModel *attributeModel;


- (void)initMsgAttribute;

@end

NS_ASSUME_NONNULL_END
