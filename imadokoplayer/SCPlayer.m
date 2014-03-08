//
//  SCPlayer.m
//  imadokoplayer
//
//  Created by gotojo on 2014/03/08.
//  Copyright (c) 2014年 imadokoplayerteam. All rights reserved.
//

#import "SCPlayer.h"
#import "SCUI.h"
#import <AVFoundation/AVFoundation.h>

@interface SCPlayer ()
- (BOOL)GetPlayList;
@property (nonatomic, strong) NSArray *tracks;
@property (nonatomic, strong) AVAudioPlayer *player;
@end

@implementation SCPlayer

- (id)init
{
    self = [super init];
    [self GetPlayList];
    return self;
}

- (BOOL)GetPlayList
{
    SCAccount *account = [SCSoundCloud account];
    if (account == nil) {
#if 0 
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Not Logged In"
                              message:@"You must login first"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
#endif
        NSLog(@"must login");
        return NO;
    }
#if 0
    SCRequestResponseHandler handler;
    handler = ^(NSURLResponse *response, NSData *data, NSError *error) {
        NSError *jsonError = nil;
        NSJSONSerialization *jsonResponse = [NSJSONSerialization
                                             JSONObjectWithData:data
                                             options:0
                                             error:&jsonError];
        if (!jsonError && [jsonResponse isKindOfClass:[NSArray class]]) {
            SCTTrackListViewController *trackListVC;
            trackListVC = [[SCTTrackListViewController alloc]
                           initWithNibName:@"SCTTrackListViewController"
                           bundle:nil];
            trackListVC.tracks = (NSArray *)jsonResponse;
            NSLog(@"%@",[trackListVC.tracks description]);
            [self presentViewController:trackListVC
                               animated:YES completion:nil];
        }
    };
    
#endif
    SCRequestResponseHandler handler;
    handler = ^(NSURLResponse *response, NSData *data, NSError *error) {
        NSError *jsonError = nil;
        NSJSONSerialization *jsonResponse = [NSJSONSerialization
                                             JSONObjectWithData:data
                                             options:0
                                             error:&jsonError];
        if (!jsonError && [jsonResponse isKindOfClass:[NSArray class]]) {
            _tracks = (NSArray *)jsonResponse;
            NSLog(@"%@",[_tracks description]);
        }
    };

    NSString *resourceURL = @"https://api.soundcloud.com/users/2472474/playlists.json";
    [SCRequest performMethod:SCRequestMethodGET
                  onResource:[NSURL URLWithString:resourceURL]
                usingParameters:nil
                 withAccount:account
      sendingProgressHandler:nil
             responseHandler:handler];
    return YES;
}

- (NSInteger)GetNumOfList
{
    return 0;
}
- (BOOL)Play:(NSInteger)playlistNum
{
    return YES;
}
- (void)Stop
{
    
}


@end
