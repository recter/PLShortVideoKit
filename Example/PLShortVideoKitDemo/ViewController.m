//
//  ViewController.m
//  PLShortVideoKitDemo
//
//  Created by suntongmian on 17/3/1.
//  Copyright © 2017年 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import "ViewController.h"
#import "RecordViewController.h"
#import "PhotoAlbumViewController.h"
#import "MulitPhotoAlbumViewController.h"
#import "H265MovieViewController.h"

#define PLS_RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = PLS_RGBCOLOR(25, 24, 36);

    UIButton *recordButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 64)];
    [recordButton setTitle:@"短视频录制" forState:UIControlStateNormal];
    recordButton.backgroundColor = [UIColor grayColor];
    [recordButton addTarget:self action:@selector(pressRecordButtonEvent:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:recordButton];
    
    UIButton *imagesToMovieButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 138, self.view.bounds.size.width, 64)];
    [imagesToMovieButton setTitle:@"图片合成视频" forState:UIControlStateNormal];
    imagesToMovieButton.backgroundColor = [UIColor grayColor];
    [imagesToMovieButton addTarget:self action:@selector(imagesToMovieButtonEvent:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:imagesToMovieButton];

    UIButton *cutMediaButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 212, self.view.bounds.size.width, 64)];
    [cutMediaButton setTitle:@"视频切割" forState:UIControlStateNormal];
    cutMediaButton.backgroundColor = [UIColor grayColor];
    [cutMediaButton addTarget:self action:@selector(cutMediaButtonEvent:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:cutMediaButton];
    
    UIButton *importH265VideoButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 286, self.view.bounds.size.width, 64)];
    [importH265VideoButton setTitle:@"导入H.265视频" forState:UIControlStateNormal];
    importH265VideoButton.backgroundColor = [UIColor grayColor];
    [importH265VideoButton addTarget:self action:@selector(importH265VideoButtonEvent:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:importH265VideoButton];
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 短视频录制
- (void)pressRecordButtonEvent:(id)sender {
    RecordViewController *recordViewController = [[RecordViewController alloc] init];
    [self presentViewController:recordViewController animated:YES completion:nil];
}

// 图片合成视频
- (void)imagesToMovieButtonEvent:(id)sender {
    PhotoAlbumViewController *photoAlbumViewController = [[PhotoAlbumViewController alloc] init];
    photoAlbumViewController.mediaType = PHAssetMediaTypeImage;
    photoAlbumViewController.maxSelectCount = 10;
    [self presentViewController:photoAlbumViewController animated:YES completion:nil];
}

// 切割视频
- (void)cutMediaButtonEvent:(id)sender {
    MulitPhotoAlbumViewController *mulitPhotoAlbumViewController = [[MulitPhotoAlbumViewController alloc] init];
    mulitPhotoAlbumViewController.mediaType = PHAssetMediaTypeVideo;
    mulitPhotoAlbumViewController.maxSelectCount = 10;
    [self presentViewController:mulitPhotoAlbumViewController animated:YES completion:nil];
}

// 导入H.265视频
- (void)importH265VideoButtonEvent:(id)sender {
    H265MovieViewController *h265MovieViewController = [[H265MovieViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:h265MovieViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"dealloc: %@", [[self class] description]);
}

@end
