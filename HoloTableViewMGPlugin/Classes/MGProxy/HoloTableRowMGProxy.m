//
//  HoloTableRowMGProxy.m
//  HoloTableView
//
//  Created by 与佳期 on 2020/3/24.
//

#import "HoloTableRowMGProxy.h"
#import "HoloTableRowMGAction.h"

@implementation HoloTableRowMGProxy

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell canSwipe:(MGSwipeDirection)direction fromPoint:(CGPoint)point {
    if (self.action.canSwipeHandler) {
        return self.action.canSwipeHandler(cell, direction, point);
    } else {
        return YES;
    }
}

- (void)swipeTableCell:(MGSwipeTableCell *)cell didChangeSwipeState:(MGSwipeState)state gestureIsActive:(BOOL)gestureIsActive {
    if (self.action.didChangeSwipeHandler) {
        self.action.didChangeSwipeHandler(cell, state, gestureIsActive);
    }
}

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell tappedButtonAtIndex:(NSInteger)index direction:(MGSwipeDirection)direction fromExpansion:(BOOL)fromExpansion {
    if (self.action.tappedSwipeButtonHandler) {
        return self.action.tappedSwipeButtonHandler(cell, index, direction, fromExpansion);
    } else {
        return NO;
    }
}

- (NSArray<UIView *> *)swipeTableCell:(MGSwipeTableCell *)cell swipeButtonsForDirection:(MGSwipeDirection)direction swipeSettings:(MGSwipeSettings *)swipeSettings expansionSettings:(MGSwipeExpansionSettings *)expansionSettings {
    if (self.action.swipeButtonsHandler) {
        return self.action.swipeButtonsHandler(cell, direction, swipeSettings, expansionSettings);
    } else {
        return [NSArray array];
    }
}

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell shouldHideSwipeOnTap:(CGPoint)point {
    if (self.action.shouldHideSwipeOnTapHandler) {
        return self.action.shouldHideSwipeOnTapHandler(cell, point);
    } else {
        return YES;
    }
}

- (void)swipeTableCellWillBeginSwiping:(MGSwipeTableCell *)cell {
    if (self.action.willBeginSwipingHandler) {
        self.action.willBeginSwipingHandler(cell);
    }
}

- (void)swipeTableCellWillEndSwiping:(MGSwipeTableCell *)cell {
    if (self.action.willEndSwipingHandler) {
        self.action.willEndSwipingHandler(cell);
    }
}

#pragma mark getter
- (HoloTableRowMGAction *)action {
    if (!_action) {
        _action = [HoloTableRowMGAction new];
    }
    return _action;
}

@end
