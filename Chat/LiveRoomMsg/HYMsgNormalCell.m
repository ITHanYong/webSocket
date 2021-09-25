//
//  HYMsgNormalCell.m
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import "HYMsgNormalCell.h"

@implementation HYMsgNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}

- (void)setMsgModel:(HYMsgModel *)msgModel {
    [super setMsgModel:msgModel];
    
    self.msgLabel.attributedText = msgModel.attributeModel.msgAttribText;
    self.bgLb.backgroundColor = msgModel.attributeModel.bgColor;
}



@end
