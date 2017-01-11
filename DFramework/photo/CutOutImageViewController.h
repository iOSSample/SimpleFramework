//
//  CutOutImageViewController.h
//  DHiOSDemo
//
//  Created by 杜豪 on 16/1/5.
//  Copyright © 2016年 杜豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CutOutImageViewController;

@protocol CutOutImageDelegate <NSObject>

- (void)imageCutOut:(CutOutImageViewController *)cutOutViewController didFinished:(UIImage *)editedImage;
- (void)imageCutOutDidCancel:(CutOutImageViewController *)cutOutViewController;

@end
@interface CutOutImageViewController : UIViewController
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) id<CutOutImageDelegate> delegate;
@property (nonatomic, assign) CGRect cropFrame;

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio;
@end
