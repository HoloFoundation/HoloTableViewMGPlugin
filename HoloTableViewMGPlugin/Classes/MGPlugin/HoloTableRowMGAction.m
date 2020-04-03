//
//  HoloTableRowMGAction.m
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2020/3/26.
//

#import "HoloTableRowMGAction.h"

@implementation HoloTableRowMGAction

- (instancetype)init {
    self = [super init];
    if (self) {
        self.canSwipe = YES;
        self.tappedSwipeButton = NO;
        self.shouldHideSwipeOnTap = YES;
    }
    return self;
}

@end
