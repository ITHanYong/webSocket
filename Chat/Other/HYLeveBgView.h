//
//  HYLeveBgView.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYLeveBgView : UIImageView

@property (nonatomic, assign) NSInteger level;

// 文字是否显示高亮
@property (nonatomic, assign) BOOL isShadeLv;

@end

NS_ASSUME_NONNULL_END
