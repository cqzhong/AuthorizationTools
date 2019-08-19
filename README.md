# AuthorizationTools

- AuthorizationTools 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* Xcode 7 or higher
* iOS 8.0 or higher
* ARC

## Installation

```ruby
pod 'AuthorizationTools'
```

```objc

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

    /*
    * 请求并判断相机权限
    * 第一次请求时候使用的是系统弹窗，第二次时候需要自己写弹窗。
    */
    __weak __typeof(self)weakSelf = self;
    [AuthorizationTools requestPrivacyType:PrivacyTypePhotos authorizationStatus:^(AuthorizationStatus status, BOOL isFirstAuthorization) {
        
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


- (void)setupAuthorizationStatus:(AuthorizationStatus)status {
    
    if (status == AuthorizationStatusAuthorized) {
        
        NSLog(@"已经授权");
    } else if (status == AuthorizationStatusDenied) {
        
        NSLog(@"用户拒绝");
    }
}




```

#### 图片展示
<div>
<img src="/images/001.png" width = "414" height = "896" alt="展示图001" />
</div>

<div>
<img src="/images/002.png" width = "414" height = "896" alt="展示图002" />
</div>

## License

AuthorizationTools is available under the MIT license. See the LICENSE file for more info.
