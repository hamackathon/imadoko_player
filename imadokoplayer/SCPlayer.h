//
//  SCPlayer.h
//  imadokoplayer
//
//  Created by gotojo on 2014/03/08.
//  Copyright (c) 2014年 imadokoplayerteam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCPlayer : NSObject

- (NSInteger)GetNumOfList;
- (BOOL)Play:(NSInteger)playlistNum;
- (void)Stop;

@end
