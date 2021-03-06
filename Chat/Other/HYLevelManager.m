//
//  HYLevelManager.m
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import "HYLevelManager.h"
#import "HYLeveBgView.h"

@interface HYLevelManager()

/** 数据源 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, UIImage *> *data;

@end

@implementation HYLevelManager

+ (instancetype)sharedInstance {
    static HYLevelManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HYLevelManager alloc] init];
        instance.data = [NSMutableDictionary dictionary];
    });
    return instance;
}

- (void)setup {
    [self.data removeAllObjects];
    
    for (NSInteger i = 0; i <= 100; i++) {
        // HYLeveBgView就是我的等级生成器，返回view
        // 启动app我们调用一次这个方法，然后内存就有生成0-100等级图片
        HYLeveBgView *view = [[HYLeveBgView alloc] init];
        view.frame = CGRectMake(0, 0, 30.0, 14.0);
        view.layer.cornerRadius = 2;
        view.layer.masksToBounds = YES;
        view.isShadeLv = YES;
        view.level = i;
        
        [self.data setObject:[self convertCreateImageWithUIView:view] forKey:[NSString stringWithFormat:@"%li", (long)i]];
    }
    
    
//    NSMutableData *data = [[NSMutableData alloc]init];
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
//    [archiver encodeObject:self.data forKey:@"talkData"];
//    [archiver finishEncoding];
//    NSLog(@"查看byte = %lu", (unsigned long)data.length);
}

- (UIImage *)imageForLevel:(NSInteger)Level {
    return [self.data objectForKey:[NSString stringWithFormat:@"%li", (long)Level]];
}


/** 将 UIView 转换成 UIImage */
- (UIImage *)convertCreateImageWithUIView:(UIView *)view {
    
    //UIGraphicsBeginImageContext(view.bounds.size);
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}



@end
