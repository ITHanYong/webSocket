//
//  HYMsgAttributeModel.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <Foundation/Foundation.h>
@class HYMsgModel;
@class HYMsgAttributeModel;

#define MsgTableViewWidth     288
#define MsgTableViewHeight    160

// cell之间的间距
#define CellLineSpacing      0
// 图片的Y轴
#define iconTopY             1.0

// 字体大小
#define MSG_LABEL_FONT  14
//#define MSG_LABEL_FONT  __Font(14)
// cell间距
#define cellLineSpeing  3

// 背景颜色 黑色 透明度0.24
#define NormalBgColor   RGBAOF(0x000000, 0.24)
// 关注背景颜色 - 红
#define RemindBgColor1  RGBA_OF(0xFF4989)
// 喜欢背景颜色 - 紫
#define RemindBgColor2  RGBA_OF(0xCA53FF)
// 分享背景颜色 - 蓝
#define RemindBgColor3  RGBA_OF(0x4ABEFF)
// 主颜色 - 黄色
#define MsgLbColor          RGBA_OF(0xFFF7AA)
// 内容颜色
#define MsgTitleColor       RGBA_OF(0xFFFFFF)
// 名字颜色
#define MsgNameColor        RGBAOF(0xFFFFFF, 0.85)

@protocol HYMsgAttributeModelDelegate <NSObject>
/** 属性文字刷新后调用 */
- (void)attributeUpdated:(HYMsgAttributeModel *)model;
@optional
// 富文本点击
- (void)msgAttributeTapAction;

@end


@interface HYMsgAttributeModel : NSObject

@property (nonatomic, weak) HYMsgModel *msgModel;
@property (nonatomic, weak) id<HYMsgAttributeModelDelegate> delegate;
//@property (nonatomic, strong) HYUserModel *user;
//@property (nonatomic, strong) HYGiftIMModel *giftIM;
// 消息高度
@property (nonatomic, assign) CGFloat msgHeight;
// 消息宽度
@property (nonatomic, assign) CGFloat msgWidth;

@property (nonatomic, strong) NSMutableAttributedString *msgAttribText;
@property (nonatomic, strong) UIColor *msgColor;
@property (nonatomic, strong) UIColor *bgColor;

/** 初始化是会计算属性 */
- (instancetype)initWithMsgModel:(HYMsgModel *)msgModel;

/** 重新计算属性 */
- (void)msgUpdateAttribute;
@end




