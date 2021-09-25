//
//  HYMsgModel.m
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import "HYMsgModel.h"

@implementation HYMsgModel



- (void)initMsgAttribute {
    self.attributeModel = [[HYMsgAttributeModel alloc] initWithMsgModel:self];
}

@end
