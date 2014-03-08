//
//  ViewController.m
//  imadokoplayer
//
//  Created by gotojo on 2014/03/08.
//  Copyright (c) 2014年 imadokoplayerteam. All rights reserved.
//

#import "ViewController.h"
#import "SCUI.h"
#import "SCPlayer.h"

@interface ViewController ()
@property (nonatomic, strong) SCPlayer *scplayer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.scplayer = [[SCPlayer alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) login:(id) sender
//- (void) login
{
    SCLoginViewControllerCompletionHandler handler = ^(NSError *error) {
        if (SC_CANCELED(error)) {
            NSLog(@"Canceled!");
        } else if (error) {
            NSLog(@"Error: %@", [error localizedDescription]);
        } else {
            NSLog(@"Done!");
        }
    };
    
    [SCSoundCloud requestAccessWithPreparedAuthorizationURLHandler:^(NSURL *preparedURL) {
        SCLoginViewController *loginViewController;
        
        loginViewController = [SCLoginViewController
                               loginViewControllerWithPreparedURL:preparedURL
                               completionHandler:handler];
        [self presentModalViewController:loginViewController animated:YES];
    }];
}

@end
