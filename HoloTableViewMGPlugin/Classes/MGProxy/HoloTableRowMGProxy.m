//
//  HoloTableRowMGProxy.m
//  HoloTableView
//
//  Created by 与佳期 on 2020/3/24.
//

#import "HoloTableRowMGProxy.h"
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#import "HoloTableRowMGProxyData.h"

@interface HoloTableRowMGProxy () <MGSwipeTableCellDelegate>

@end

@implementation HoloTableRowMGProxy

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell canSwipe:(MGSwipeDirection)direction fromPoint:(CGPoint)point {
    
    return YES;
}

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell canSwipe:(MGSwipeDirection)direction DEPRECATED_ATTRIBUTE {
    
    return YES;
}

- (void)swipeTableCell:(MGSwipeTableCell *)cell didChangeSwipeState:(MGSwipeState)state gestureIsActive:(BOOL)gestureIsActive {
    
}

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell tappedButtonAtIndex:(NSInteger)index direction:(MGSwipeDirection)direction fromExpansion:(BOOL)fromExpansion {
    
    return YES;
}

- (NSArray<UIView *> *)swipeTableCell:(MGSwipeTableCell *)cell swipeButtonsForDirection:(MGSwipeDirection)direction swipeSettings:(MGSwipeSettings *)swipeSettings expansionSettings:(MGSwipeExpansionSettings *)expansionSettings {
    
    return @[];
}

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell shouldHideSwipeOnTap:(CGPoint)point {
    
    return YES;
}

- (void)swipeTableCellWillBeginSwiping:(MGSwipeTableCell *)cell {
    
}

- (void)swipeTableCellWillEndSwiping:(MGSwipeTableCell *)cell {
    
}

#pragma mark getter
- (HoloTableRowMGProxyData *)proxyData {
    if (!_proxyData) {
        _proxyData = [HoloTableRowMGProxyData new];
    }
    return _proxyData;
}

@end
