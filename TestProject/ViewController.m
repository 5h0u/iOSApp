//
//  ViewController.m
//  TestProject
//
//  Created by yamasaki.s on 2016/06/15.
//  Copyright © 2016年 yamasaki.s. All rights reserved.
//

//Camera
#import <AVFoundation/AVFoundation.h>
//#import "TableCell.h"
#import "ViewController.h"

@interface ViewController ()

//@property (weak, nonatomic)IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *previewView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //テーブルセットアップ
//  [self tableSetup];
    
    //カメラセットアップ
    [self setupAVCamera];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
/*
-(void)tableSetup{
    _tableView.dataSource = self;
    _tableView.delegate = self;
 
    [_tableView registerNib:[UINib nibWithNibName:@"TableCell" 
                bundle:nil]forCellReuseIdentifier:@"Cell"];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 89;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}
*/

 -(void)setupAVCamera{
 
    AVCaptureSession *session = [[AVCaptureSession alloc]init];
    AVCaptureDevice *camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *videoInput = [[AVCaptureDeviceInput alloc]initWithDevice:camera error:nil];
 
    if([session canAddInput:videoInput])
    [session addInput:videoInput];
     
    //出力（画像）
    AVCaptureStillImageOutput *imageOutput = [[AVCaptureStillImageOutput alloc]init];
    [session addOutput:imageOutput];
 
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:session];
    [previewLayer setBackgroundColor:[[UIColor grayColor] CGColor]];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];

    CALayer *layer = self.previewView.layer;
    layer.masksToBounds = YES;
    [previewLayer setFrame:[layer bounds]];
    [layer addSublayer:previewLayer];

    [session startRunning];
 }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
