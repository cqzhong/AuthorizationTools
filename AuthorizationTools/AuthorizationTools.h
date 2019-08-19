//
//  AuthorizationTools.h
//  AuthorizationTools_Example
//
//  Created by cqz on 2019/8/18.
//  Copyright © 2019 cqzhong. All rights reserved.
//

@import Foundation;
@import UIKit;
@import AssetsLibrary;
@import Photos;
@import AddressBook;
@import Contacts;
@import AVFoundation;
@import CoreBluetooth;
@import EventKit;
@import Speech;


typedef NS_ENUM(NSUInteger, PrivacyType){
    PrivacyTypeNone               = 0,
    PrivacyTypePhotos             = 1,// 照片
    PrivacyTypeCamera             = 2,// 相机
    PrivacyTypeMicrophone         = 3,// 麦克风
    PrivacyTypeAddressBook        = 4,// 通讯录
    PrivacyTypeCalendars          = 5,// 日历
    PrivacyTypeReminders          = 6,// 提醒事项
    PrivacyTypeSpeechRecognition  = 7,// 语音识别 >= iOS10
};

typedef NS_ENUM(NSUInteger, AuthorizationStatus) {
    AuthorizationStatusAuthorized = 0,    // 已授权
    AuthorizationStatusDenied,            // 拒绝
    AuthorizationStatusRestricted,        // 应用没有相关权限，且当前用户无法改变这个权限，比如:家长控制
    AuthorizationStatusNotSupport         // 硬件等不支持
};

//typedef void(^accessForTypeResultBlock)(ECAuthorizationStatus status, ECPrivacyType type);
//
//

@interface AuthorizationTools : NSObject

/**
 请求对应的权限
 
 @param type 权限类型
 @param callback 返回权限状态，和是否是is第一次授权
 */
+ (void)requestPrivacyType:(PrivacyType)type authorizationStatus:(void(^)(AuthorizationStatus status, BOOL isFirstAuthorization))callback;



@end
