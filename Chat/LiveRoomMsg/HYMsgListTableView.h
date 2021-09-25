//
//  HYMsgListTableView.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <UIKit/UIKit.h>
#import "HYMsgModel.h"


// 刷新消息方式
typedef NS_ENUM(NSUInteger, HYReloadLiveMsgRoomType) {
    HYReloadLiveMsgRoom_Time = 0, // 0.5秒刷新一次消息
    HYReloadLiveMsgRoom_Direct,   // 直接刷新
};


@protocol RoomMsgListDelegate;


@interface HYMsgListTableView : UIView
@property (nonatomic, weak) id<RoomMsgListDelegate> delegate;
@property (nonatomic, assign) HYReloadLiveMsgRoomType reloadType;
/** 消息列表 */
@property (nonatomic, strong) UITableView *tableView;

/** 添加新的消息 */
- (void)addNewMsg:(HYMsgModel *)msgModel;

// 倒计时显示的系统提示语
- (void)startDefaultMsg:(NSString *)text;

//清空消息重置
- (void)reset;
- (void)startTimer;

@end



@protocol RoomMsgListDelegate <NSObject>
@optional
- (void)startScroll;
- (void)endScroll;
- (void)touchSelfView;
// 回复
- (void)didAiTe:(HYUserModel *)user;
- (void)didUser:(HYUserModel *)user;

// 提示关注 分享 送礼物点击
- (void)didRemindFollowComplete:(void(^)(BOOL))complete;
- (void)didRemindShare;
- (void)didRemindGifts;
- (void)didCopyWithText:(NSString *)text;
@end
