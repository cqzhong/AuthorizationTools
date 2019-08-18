//
//  TestViewController.m
//  AuthorizationTools_Example
//
//  Created by cqz on 2019/8/18.
//  Copyright © 2019 cqzhong. All rights reserved.
//

#import "TestViewController.h"
#import "AuthorizationTools.h"

@interface TestViewController ()

@end

@implementation TestViewController

#pragma mark - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubviews];
}
#pragma mark - Intial Methods
- (void)initSubviews {
    
    __weak __typeof(self)weakSelf = self;
    [AuthorizationTools requestImagePickerAuthorization:^(AuthorizationStatus status, BOOL isFirstAuthorization) {
        
        NSLog(@"授权：%@", isFirstAuthorization ? @"是第一次授权" : @"不是第一次授权");
        
        if (!isFirstAuthorization) {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"需要你的同意，来访问相册上传头像" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction *setAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //跳入当前App设置界面
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }];
            [alertController addAction:cancelAction];
            [alertController addAction:setAction];
            
            [weakSelf presentViewController:alertController animated:true completion:nil];

        } else {
            
            [weakSelf setupAuthorizationStatus:status];
        }
    }];
    
//    [AuthorizationTools requestCameraAuthorization:^(AuthorizationStatus status, BOOL isFirstAuthorization) {
//
//        if (status == AuthorizationStatusAuthorized) {
//
//            NSLog(@"已经授权");
//        } else if (status == AuthorizationStatusDenied) {
//
//            NSLog(@"用户拒绝");
//        }
//    }];
//
//    [AuthorizationTools requestRecordingAuthorization:^(AuthorizationStatus status, BOOL isFirstAuthorization) {
//
//        if (status == AuthorizationStatusAuthorized) {
//
//            NSLog(@"已经授权");
//        } else if (status == AuthorizationStatusDenied) {
//
//            NSLog(@"用户拒绝");
//        }
//    }];
//
//    [AuthorizationTools requestAddressBookAuthorization:^(AuthorizationStatus status, BOOL isFirstAuthorization) {
//
//        if (status == AuthorizationStatusAuthorized) {
//
//            NSLog(@"已经授权");
//        } else if (status == AuthorizationStatusDenied) {
//
//            NSLog(@"用户拒绝");
//        }
//    }];
    

}
#pragma mark - Network Methods
- (void)loadData {
    
}

#pragma mark - Target Methods

#pragma mark - Public Methods

#pragma mark - Private Method
- (void)setupAuthorizationStatus:(AuthorizationStatus)status {
    
    if (status == AuthorizationStatusAuthorized) {
        
        NSLog(@"已经授权");
    } else if (status == AuthorizationStatusDenied) {
        
        NSLog(@"用户拒绝");
    }
}
#pragma mark - External Delegate

#pragma mark - UITableViewDelegate,UITableViewDataSource

#pragma mark - Setter Getter Methods

@end
