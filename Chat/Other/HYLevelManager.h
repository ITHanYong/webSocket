//
//  HYLevelManager.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <Foundation/Foundation.h>


@interface HYLevelManager : NSObject

+ (instancetype)sharedInstance;

/** 初始化（APP生命周期只需要执行一次） */
- (void)setup;

- (UIImage *)imageForLevel:(NSInteger)Level;

@end


