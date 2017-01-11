//
//  DHImagePickerManager.m
//  OpenPhotoCarem
//
//  Created by 杜豪 on 16/1/5.
//  Copyright © 2016年 杜豪. All rights reserved.
//

#import "DHImagePickerManager.h"
#import "UIImage+Orientation.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface DHImagePickerManager() <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation DHImagePickerManager



- (void) setNeedImageInController:(UIViewController<DHImagePikerDelegate>*) controller {
    self.controller = controller;
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle: nil
                                                             delegate: self
                                                    cancelButtonTitle: @"取消"
                                               destructiveButtonTitle: nil
                                                    otherButtonTitles: @"拍摄照片",@"选择照片", nil];
    [choiceSheet showInView: controller.view];
}

#pragma mark - ActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // 拍照
        if ([self isCameraAvailable]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypeCamera;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self.controller presentViewController:controller
                                          animated:YES
                                        completion:^(void){
                                            NSLog(@"imagePicker display");
                                        }];
        } else {
             [[[UIAlertView alloc] initWithTitle:@"相机不可用" message:nil delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
        }
    } else if (buttonIndex == 1) {
        // 从相册中选中
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
        [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
        controller.mediaTypes = mediaTypes;
        controller.delegate = self;
        [self.controller presentViewController:controller
                                      animated:YES
                                    completion:^(void){
                                        NSLog(@"imagePicker display");
                                    }];
        
    } else {
        
        // 取消
    }
}

- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSLog(@"%@",info);
        // 根据delegate方法返回
        if ([self.controller respondsToSelector:@selector(didSelectedImage:)]) {
            [self.controller didSelectedImage: [portraitImg fixOrientation]];
        }
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

@end
