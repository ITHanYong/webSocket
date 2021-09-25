//
//  HYUserModel.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYUserModel : NSObject

@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *userID;

@property (nonatomic, assign) NSInteger level;
// 0：男    1：女
@property (nonatomic, assign) NSInteger gender;

@end

NS_ASSUME_NONNULL_END
