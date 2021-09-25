//
//  HYLayoutButton.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EWLayoutButtonStyle) {
    EWLayoutButtonStyleLeftImageRightTitle,
    EWLayoutButtonStyleLeftTitleRightImage,
    EWLayoutButtonStyleUpImageDownTitle,
    EWLayoutButtonStyleUpTitleDownImage
};


/// 重写layoutSubviews的方式实现布局，忽略imageEdgeInsets、titleEdgeInsets和contentEdgeInsets

@interface HYLayoutButton : UIButton
/// 布局方式
@property (nonatomic, assign) EWLayoutButtonStyle layoutStyle;
/// 图片和文字的间距，默认值8
@property (nonatomic, assign) CGFloat midSpacing;
/// 指定图片size
@property (nonatomic, assign) CGSize imageSize;

@end
