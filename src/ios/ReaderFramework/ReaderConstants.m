//
//  ReaderConstants.m
//  Reader v2.8.1
//
//  Created by Julius Oklamcak on 2011-07-01.
//  Copyright © 2011-2014 Julius Oklamcak. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to
//  do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "ReaderConstants.h"
#import <UIKit/UIKit.h>

static NSString *const kReaderCopyrightNotice = @"Reader v2.x.y • Copyright © 2011-2014 Julius Oklamcak. All rights reserved.";

@implementation ReaderConstants

+ (ReaderConstants *)sharedReaderConstants{
    static ReaderConstants *_sharedReaderConstants = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedReaderConstants = [[self alloc] init];
    });

    return _sharedReaderConstants;
}

- (instancetype)init{
    self = [super init];

    if (self) {
        // Default Values

        self.flatUI = [ReaderConstants isAtLeastiOS7];
        self.showShadows = YES;
        self.enableThumbs = YES;
        self.disableRetina = NO;
        self.enablePreview = YES;
        self.disableIdle = NO;
        self.standalone = NO;
        self.bookmarks = YES;
        self.landscapeDoublePage = NO;
        self.landscapeSingleFirstPage = YES;
        self.enableShare = YES;
        self.title = @"";
    }

    return self;
}

+ (BOOL)isAtLeastiOS7{
    NSString *reqSysVer = @"7.0";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    return [currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending;
}

@end
