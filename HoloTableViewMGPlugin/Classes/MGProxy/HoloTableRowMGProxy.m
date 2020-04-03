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
    if (self.action.delegate && [self.action.delegate respondsToSelector:@selector(swipeTableCell:canSwipe:fromPoint:)]) {
        return [self.action.delegate swipeTableCell:cell canSwipe:direction fromPoint:point];
    }
    
    if (self.action.canSwipeHandler) {
        return self.action.canSwipeHandler(cell, direction, point);
    } else {
        return self.action.canSwipe;
    }
}

- (void)swipeTableCell:(MGSwipeTableCell *)cell didChangeSwipeState:(MGSwipeState)state gestureIsActive:(BOOL)gestureIsActive {
    if (self.action.delegate && [self.action.delegate respondsToSelector:@selector(swipeTableCell:didChangeSwipeState:gestureIsActive:)]) {
        [self.action.delegate swipeTableCell:cell didChangeSwipeState:state gestureIsActive:gestureIsActive];
        return;
    }
    
    if (self.action.didChangeSwipeHandler) {
        self.action.didChangeSwipeHandler(cell, state, gestureIsActive);
    }
}

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell tappedButtonAtIndex:(NSInteger)index direction:(MGSwipeDirection)direction fromExpansion:(BOOL)fromExpansion {
    if (self.action.delegate && [self.action.delegate respondsToSelector:@selector(swipeTableCell:tappedButtonAtIndex:direction:fromExpansion:)]) {
        return [self.action.delegate swipeTableCell:cell tappedButtonAtIndex:index direction:direction fromExpansion:fromExpansion];
    }
    
    if (self.action.tappedSwipeButtonHandler) {
        return self.action.tappedSwipeButtonHandler(cell, index, direction, fromExpansion);
    } else {
        return self.action.tappedSwipeButton;
    }
}

- (NSArray<UIView *> *)swipeTableCell:(MGSwipeTableCell *)cell swipeButtonsForDirection:(MGSwipeDirection)direction swipeSettings:(MGSwipeSettings *)swipeSettings expansionSettings:(MGSwipeExpansionSettings *)expansionSettings {
    if (self.action.delegate && [self.action.delegate respondsToSelector:@selector(swipeTableCell:swipeButtonsForDirection:swipeSettings:expansionSettings:)]) {
        return [self.action.delegate swipeTableCell:cell swipeButtonsForDirection:direction swipeSettings:swipeSettings expansionSettings:expansionSettings];
    }
    
    if (self.action.swipeButtonsHandler) {
        return self.action.swipeButtonsHandler(cell, direction, swipeSettings, expansionSettings);
    } else if (direction == MGSwipeDirectionLeftToRight) {
        return self.action.leftToRightButtons;
    } else if (direction == MGSwipeDirectionRightToLeft) {
        return self.action.rightToLeftButtons;
    } else {
        return [NSArray new];
    }
}

- (BOOL)swipeTableCell:(MGSwipeTableCell *)cell shouldHideSwipeOnTap:(CGPoint)point {
    if (self.action.delegate && [self.action.delegate respondsToSelector:@selector(swipeTableCell:shouldHideSwipeOnTap:)]) {
        return [self.action.delegate swipeTableCell:cell shouldHideSwipeOnTap:point];
    }
    
    if (self.action.shouldHideSwipeOnTapHandler) {
        return self.action.shouldHideSwipeOnTapHandler(cell, point);
    } else {
        return self.action.shouldHideSwipeOnTap;
    }
}

- (void)swipeTableCellWillBeginSwiping:(MGSwipeTableCell *)cell {
    if (self.action.delegate && [self.action.delegate respondsToSelector:@selector(swipeTableCellWillBeginSwiping:)]) {
        [self.action.delegate swipeTableCellWillBeginSwiping:cell];
        return;
    }
    
    if (self.action.willBeginSwipingHandler) {
        self.action.willBeginSwipingHandler(cell);
    }
}

- (void)swipeTableCellWillEndSwiping:(MGSwipeTableCell *)cell {
    if (self.action.delegate && [self.action.delegate respondsToSelector:@selector(swipeTableCellWillEndSwiping:)]) {
        [self.action.delegate swipeTableCellWillEndSwiping:cell];
        return;
    }
    
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
