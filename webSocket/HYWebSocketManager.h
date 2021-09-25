//
//  HYWebSocketManager.h
//  webSocket
//
//  Created by HanYong on 2021/9/25.
//

#import <Foundation/Foundation.h>
#import "SRWebSocket.h"

typedef NS_ENUM(NSUInteger,WebSocketConnectType){
    WebSocketDefault = 0, //初始状态,未连接
    WebSocketConnect,      //已连接
    WebSocketDisconnect    //连接后断开
};

@class HYWebSocketManager;
@protocol WebSocketManagerDelegate <NSObject>

- (void)webSocketManagerDidReceiveMessageWithString:(NSString *_Nullable)string;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HYWebSocketManager : NSObject

@property (nonatomic, strong) SRWebSocket *webSocket;
@property (nonatomic, weak)  id<WebSocketManagerDelegate > delegate;
@property (nonatomic, assign)   BOOL isConnect;  //是否连接
@property (nonatomic, assign)   WebSocketConnectType connectType;

+ (instancetype)shared;
- (void)connectServer:(NSString *)liveId;//建立长连接
- (void)reConnectServer;//重新连接
- (void)RMWebSocketClose;//关闭长连接
- (void)sendDataToServer:(NSString *)data;//发送数据给服务器

@end

NS_ASSUME_NONNULL_END

