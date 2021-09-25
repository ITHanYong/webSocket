//
//  HYLiveMsgBassCell.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <UIKit/UIKit.h>
#import "HYMsgModel.h"
#import "HYLeveBgView.h"

@protocol MsgCellGesDelegate;

NS_ASSUME_NONNULL_BEGIN

/**
 *  TCMsgListCell 类说明：
 *  用户消息列表cell，用于展示消息信息
 */

@interface HYLiveMsgBassCell : UITableViewCell <HYMsgAttributeModelDelegate>

@property (nonatomic, weak) id<MsgCellGesDelegate> delegate;
@property (nonatomic, strong) YYLabel *msgLabel;
@property (nonatomic, strong) UIImageView *bgLb;
@property (nonatomic, strong) HYMsgModel *msgModel;

/** cell标示 */
+ (NSString *)msgCellIdentifier;

+ (HYLiveMsgBassCell *)tableView:(UITableView *)tableView cellForMsg:(HYMsgModel *)msg indexPath:(NSIndexPath *)indexPath delegate:(id<MsgCellGesDelegate>)delegate;

// 添加长按点击事件
- (void)addLongPressGes;

@end

@protocol MsgCellGesDelegate <NSObject>
- (void)longPressGes:(HYMsgModel *)MsgModel;
- (void)userClick:(HYUserModel *)user;
- (void)touchMsgCellView;

// 提示关注 分享 送礼物点击
- (void)remindCellFollow:(HYMsgModel *)msgModel;
- (void)remindCellShare;
- (void)remindCellGifts;

/** 消息属性文字发生变化（更新对应cell） */
- (void)msgAttrbuiteUpdated:(HYMsgModel *)msgModel;

@end


NS_ASSUME_NONNULL_END
