//
//  DHImagePickerManager.h
//  OpenPhotoCarem
//
//  Created by 杜豪 on 16/1/5.
//  Copyright © 2016年 杜豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@protocol DHImagePikerDelegate <NSObject>

//
// 得到拍照或者相册中的原图
//
- (void) didSelectedImage:(UIImage *) image;

@end

@interface DHImagePickerManager : NSObject

@property (nonatomic, weak) UIViewController<DHImagePikerDelegate> *controller;

- (void) setNeedImageInController:(UIViewController<DHImagePikerDelegate>*)controller;
@end
