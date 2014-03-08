//
//  ViewController.m
//  imadokoplayer
//
//  Created by gotojo on 2014/03/08.
//  Copyright (c) 2014年 imadokoplayerteam. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *minuteLabel;
@property (strong, nonatomic) AVAudioPlayer *player;
- (void)play:(int)index;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    // タイマー
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(didSecondUpdate:) userInfo:nil repeats:YES];
    
    // 位置
    [self play:3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSecondUpdate:(NSTimer *)timer
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:2014];
    [comps setMonth:3];
    [comps setDay:8];
    [comps setHour:19];
    [comps setMinute:0];
    [comps setSecond:0];
    NSDate *target = [calendar dateFromComponents:comps];
    NSDate *now = [NSDate date];
    
    float tmp= [target timeIntervalSinceDate:now];
    int hh = (int)(tmp / 3600);
    int mm = (int)((tmp - (hh * 3600)) / 60);
    
    self.hourLabel.text = [NSString stringWithFormat:@"%02d", hh];
    self.minuteLabel.text = [NSString stringWithFormat:@"%02d", mm];
}

- (void)play:(int)index
{
    if ((index < 0) || (index >=4)) {
        NSLog(@"nosong");
        return;
    }
    // プレイヤー
    NSString *strs[] = {@"01 Z伝説 〜終わりなき革命〜",
        @"04 ワニとシャンプー",
        @"13 ももクロのニッポン万歳!",
        @"14 ココ☆ナツ"};
    
    NSString *path = [[NSBundle mainBundle] pathForResource:strs[index] ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
   _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [_player play];
}

@end
