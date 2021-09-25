//
//  ViewController.m
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import "ViewController.h"

#import "HYMsgModel.h"
#import "HYUserModel.h"
#import "HYGiftModel.h"
#import "HYMsgListTableView.h"
#import "HYDebugToolManager.h"

// 每一秒发送多少条消息
#define MAXCOUNT  30

@interface ViewController ()<UITextFieldDelegate, RoomMsgListDelegate>
{
    NSArray<NSString *> *_conmentAry;
    NSArray<NSString *> *_nameAry;
}
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic) dispatch_source_t timer;
@property (nonatomic, strong) HYMsgListTableView *msgTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // DebugToolTypeMemory | DebugToolTypeCPU | DebugToolTypeFPS
    //[[HYDebugToolManager sharedInstance] toggleWith:DebugToolTypeAll];
    
    _conmentAry = @[@"如果我是DJ你会爱我吗🏷💋❤️💘💇 哟哟哟~~~",
                    @"好喜欢主播，主播唱歌太好听了🎤🎤🎤🎤",  @"تیتینینینی这是阿拉伯文，阿拉伯文从右到左排版，我们强制把它从按照正常排版显示~~",
                    @"哟哟~~切克闹！煎饼果子来一套~~😻✊❤️🙇",
                    @"哟哟！！你看那面又大又宽，你看那碗又大又圆！哟哟~~~😁😁😁😁😁😁",
                    @"蔡徐坤是NBA打球最帅的woman~~😏😏😏😏😏😏，不服来辩~~",
                    @"吴亦凡是rap界最有内涵的woman😏😏😏😏😏😏，不服来辩~~~"];
    
    _nameAry = @[@"蔡徐坤", @"吴亦凡", @"吴京", @"成龙", @"郭敬明"];
    
    self.textField.delegate = self;
    
    [self.view addSubview:self.msgTableView];
    self.msgTableView.frame = CGRectMake(8, 100, MsgTableViewWidth, MsgTableViewHeight);
    //self.msgTableView.backgroundColor = [UIColor whiteColor];
    
    
    //[self creatTestIMMsg:NDSubMsgType_Announcement];
    
    [self start:nil];
}

// 随机生成不同类型消息
- (void)creatTestIMMsg:(NDSubMsgType)subType {
    HYMsgModel *msgModel = [HYMsgModel new];
    if (subType == 0) {
        msgModel.subType = arc4random() % 7;
    } else {
        msgModel.subType = subType;
    }
    msgModel.msgID = [NSString stringWithFormat:@"msgID_%u", arc4random() % 10000];
    
    HYUserModel *user = [HYUserModel new];
    user.nickName = _nameAry[arc4random() % _nameAry.count];
    user.userID = [NSString stringWithFormat:@"userID_%ld", msgModel.subType];
    user.level = arc4random() % 100;
    user.gender = arc4random() % 1;
    
    msgModel.user = user;
    
    switch (msgModel.subType) {
        case HYSubMsgType_Unknown:
            return;
            break;
        case HYSubMsgType_Share:
        {
            
        }
            break;
        case HYSubMsgType_Comment:
        {
            msgModel.content = _conmentAry[arc4random() % _conmentAry.count];
        }
            break;
        case HYSubMsgType_At:
        {
            msgModel.atUser = [HYUserModel new];
            msgModel.atUser.nickName = @"这是一个被@的用户";
            msgModel.atUser.userID = @"10086";
            msgModel.atUser.gender = arc4random() % 1;
            msgModel.atUser.level = arc4random() % 100;
            
            msgModel.content = _conmentAry[arc4random() % _conmentAry.count];
        }
            break;
        case HYSubMsgType_MemberEnter:
            
            break;
        case HYSubMsgType_Announcement:
            msgModel.content = @"这是一条系统公告，这是一条系统公告，这是一条系统公告，这是一条系统公告，这是一条系统公告。";
            break;
        case HYSubMsgType_Gift_Text:
        {
            msgModel.quantity = @"1";
            msgModel.giftModel = [HYGiftModel new];
            msgModel.giftModel.giftID = [NSString stringWithFormat:@"giftID_%u", arc4random() % 10];
            msgModel.giftModel.thumbnailUrl = @"https://showme-livecdn.9yiwums.com/gift/gift/20190225/b9a2dc3f1bef436598dfa470eada6a60.png";
            msgModel.giftModel.name = @"烟花🎆";
        }
            break;
            
        default:
            break;
    }
    // 生成富文本模型
    [msgModel initMsgAttribute];
    
    
    [self.msgTableView addNewMsg:msgModel];
}

- (void)clear:(UIButton *)sender {
    [self.msgTableView reset];
    
    if (self.msgTableView.reloadType == HYReloadLiveMsgRoom_Time) {
        [self.msgTableView startTimer];
    }
}

// 开始模拟发送消息
- (void)start:(UIButton *)sender {
    if (_timer == nil) {
        EWWeakSelf
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC/MAXCOUNT, 0);
        dispatch_source_set_event_handler(_timer, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf creatTestIMMsg:arc4random() % 7];
            });
        });
        dispatch_resume(_timer);
    }
}


// 点击return手动发送文本类型消息
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self creatTestIMMsg:HYSubMsgType_Comment];
    
    return YES;
}

- (HYMsgListTableView *)msgTableView {
    if(!_msgTableView){
        _msgTableView = [[HYMsgListTableView alloc] init];
        _msgTableView.delegate = self;
        _msgTableView.reloadType = HYReloadLiveMsgRoom_Time;
    }
    return _msgTableView;
}



@end
