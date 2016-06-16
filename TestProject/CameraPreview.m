//
//  CameraPreview.m
//  TestProject
//
//  Created by yamasaki.s on 2016/06/16.
//  Copyright © 2016年 yamasaki.s. All rights reserved.
//

#import "CameraPreview.h"
#import <AVFoundation/AVFoundation.h>

@implementation CameraPreview

+(void)setupAVCamera{
    AVCaptureSession *session = [[AVCaptureSession alloc]init];
    AVCaptureDevice *camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *videoInput = [[AVCaptureDeviceInput alloc]initWithDevice:camera error:nil];
    
    if([session canAddInput:videoInput])
        [session addInput:videoInput];
    //出力（画像）
    /*
     AVCaptureStillImageOutput *imageOutput = [[AVCaptureStillImageOutput alloc]init];
     [session addOutput:imageOutput];
     */
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:session];
    [previewLayer setBackgroundColor:[[UIColor grayColor] CGColor]];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    
    CALayer *layer = self.previewView.layer;
    layer.masksToBounds = YES;
    [previewLayer setFrame:[layer bounds]];
    [layer addSublayer:previewLayer];
    
    [session startRunning];
    
}

@end
