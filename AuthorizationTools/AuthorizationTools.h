//
//  AuthorizationTools.h
//  AuthorizationTools_Example
//
//  Created by cqz on 2019/8/18.
//  Copyright © 2019 cqzhong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, AuthorizationStatus) {
    AuthorizationStatusAuthorized = 0,    // 已授权
    AuthorizationStatusDenied,            // 拒绝
    AuthorizationStatusRestricted,        // 应用没有相关权限，且当前用户无法改变这个权限，比如:家长控制
    AuthorizationStatusNotSupport         // 硬件等不支持
};


@interface AuthorizationTools : NSObject

/**
 请求相册访问权限
 
 @param callback 是否授权
 */
+ (void)requestImagePickerAuthorization:(void(^)(AuthorizationStatus status, BOOL isFirstAuthorization))callback;


/**
 请求相机权限
 
 @param callback 是否授权
 */
+ (void)requestCameraAuthorization:(void(^)(AuthorizationStatus status, BOOL isFirstAuthorization))callback;


/**
 请求通讯录权限
 
 @param callback 是否授权
 */
+ (void)requestAddressBookAuthorization:(void (^)(AuthorizationStatus status, BOOL isFirstAuthorization))callback;


/**
 请求录音权限
 
 @param callback 是否授权
 */
+ (void)requestRecordingAuthorization:(void (^)(AuthorizationStatus status, BOOL isFirstAuthorization))callback;


@end

NS_ASSUME_NONNULL_END
