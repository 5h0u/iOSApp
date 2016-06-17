//
//  ViewController.m
//  TestProject
//
//  Created by yamasaki.s on 2016/06/15.
//  Copyright © 2016年 yamasaki.s. All rights reserved.
//

//Camera
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *previewView;
@property (strong, nonatomic) AVCaptureSession *session;
@property (strong, nonatomic) AVCaptureDevice *camera;
@property (strong, nonatomic) AVCaptureStillImageOutput *imageOutput;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)removeAVCamera{
    //セッション停止
    [_session stopRunning];
    for(AVCaptureOutput *output in _session.outputs){
        [_session removeOutput:output];
    }
    for(AVCaptureInput *input in _session.inputs){
        [_session removeInput:input];
    }
    _imageOutput = nil;
    _camera = nil;
    _session = nil;
}
- (void)setupAVCamera{
    _session = [[AVCaptureSession alloc]init];
    
    //カメラ取得
    _camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *videoInput = [[AVCaptureDeviceInput alloc]initWithDevice:_camera error:nil];
 
    if([_session canAddInput:videoInput])
        [_session addInput:videoInput];
     
    //出力（画像）
    _imageOutput = [[AVCaptureStillImageOutput alloc]init];
    [_session addOutput:_imageOutput];
 
    //プレビュー画面生成
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:_session];
    
    [previewLayer setBackgroundColor:[[UIColor grayColor] CGColor]];
    //[previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    //レイアウトをViewにセット
    CALayer *layer = self.previewView.layer;
    layer.masksToBounds = YES;
    [previewLayer setFrame:[layer bounds]];
    [layer addSublayer:previewLayer];
    
    //セッション開始
    [_session startRunning];
 }
-(void)viewDidLayoutSubviews{
    [self setupAVCamera];
}
-(void)viewDidDisappear:(BOOL)animated{
    [self removeAVCamera];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
