//
//  CameraPreview.h
//  TestProject
//
//  Created by yamasaki.s on 2016/06/16.
//  Copyright © 2016年 yamasaki.s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraPreview : UIView

@property(weak, nonatomic)IBOutlet UIView *previewView;

+(void)setupAVCamera;

@end
