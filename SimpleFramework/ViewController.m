//
//  ViewController.m
//  SimpleFramework
//
//  Created by 杜豪 on 2017/1/11.
//  Copyright © 2017年 快人HR. All rights reserved.
//

#import "ViewController.h"
#import "DHImagePickerManager.h"

@interface ViewController ()<DHImagePikerDelegate>{
    DHImagePickerManager *imagePicker;
}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imagePicker = [[DHImagePickerManager alloc] init];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickOnButton:(id)sender {
    [imagePicker setNeedImageInController:self];
}
- (void) didSelectedImage:(UIImage *) image{
    if (image) {
        self.imageView.image = image;
    }
}

@end
