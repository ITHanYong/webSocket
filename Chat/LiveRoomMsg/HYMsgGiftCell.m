//
//  HYMsgGiftCell.m
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import "HYMsgGiftCell.h"


@interface HYMsgGiftCell ()


@end

@implementation HYMsgGiftCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)msgAttributeTapAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(userClick:)]) {
        [self.delegate userClick:self.msgModel.user];
    }
}

- (void)setMsgModel:(HYMsgModel *)msgModel {
    [super setMsgModel:msgModel];
    //[self setNeedsLayout];
    
    
    self.msgLabel.attributedText = msgModel.attributeModel.msgAttribText;
    self.bgLb.backgroundColor = msgModel.attributeModel.bgColor;
}

@end
