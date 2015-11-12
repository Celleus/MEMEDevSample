//
//  MEMEDev.h
//  MEMEDev
//
//  Created by Celleus on 2015/11/12.
//  Copyright © 2015年 Celleus. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MEMERealTimeData.h"

//! Project version number for MEMEDev.
FOUNDATION_EXPORT double MEMEDevVersionNumber;

//! Project version string for MEMEDev.
FOUNDATION_EXPORT const unsigned char MEMEDevVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <MEMEDev/PublicHeader.h>


@interface MEMEDev : NSObject

+ (MEMEDev *)sharedInstance;
@property (nonatomic,retain) id delegate;
@property (nonatomic,retain) NSString *csvName;

+ (void)startDataReport;
+ (void)stopDataReport;

+ (NSString *)helloWorld;

@end

@interface delegate
- (void)memeRealTimeModeDataReceived:(MEMERealTimeData *)data;
@end