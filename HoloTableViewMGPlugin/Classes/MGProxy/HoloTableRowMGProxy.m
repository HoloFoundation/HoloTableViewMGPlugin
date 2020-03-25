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
    return self.action.canSwipeHandler(cell, direction, point);
}

- (void)swipeTableCell:(MGSwipeTableCell *)cell didChangeSwipeState:(MGSwipeState)state gestureIsActive:(BOOL)gestureIsActive {
    self.action.didChangeSwipeHandler(cell, state, gestureIsActive);
}

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell tappedButtonAtIndex:(NSInteger)index direction:(MGSwipeDirection)direction fromExpansion:(BOOL)fromExpansion {
    return self.action.tappedSwipeButtonHandler(cell, index, direction, fromExpansion);
}

- (NSArray<UIView *> *)swipeTableCell:(MGSwipeTableCell *)cell swipeButtonsForDirection:(MGSwipeDirection)direction swipeSettings:(MGSwipeSettings *)swipeSettings expansionSettings:(MGSwipeExpansionSettings *)expansionSettings {
    return self.action.swipeButtonsHandler(cell, direction, swipeSettings, expansionSettings);
}

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell shouldHideSwipeOnTap:(CGPoint)point {
    return self.action.shouldHideSwipeOnTapHandler(cell, point);
}

- (void)swipeTableCellWillBeginSwiping:(MGSwipeTableCell *)cell {
    self.action.willBeginSwipingHandler(cell);
}

- (void)swipeTableCellWillEndSwiping:(MGSwipeTableCell *)cell {
    self.action.willEndSwipingHandler(cell);
}

#pragma mark getter
- (HoloTableRowMGAction *)action {
    if (!_action) {
        _action = [HoloTableRowMGAction new];
    }
    return _action;
}

@end
