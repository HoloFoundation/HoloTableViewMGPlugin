//
//  HoloTableRowMGAction.h
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2020/3/26.
//

#import <Foundation/Foundation.h>
#import <MGSwipeTableCell/MGSwipeTableCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface HoloTableRowMGAction : NSObject

@property (nonatomic, copy) BOOL (^canSwipeHandler)(MGSwipeTableCell *cell, MGSwipeDirection direction, CGPoint fromPoint);

@property (nonatomic, copy) void (^didChangeSwipeHandler)(MGSwipeTableCell *cell, MGSwipeState state, BOOL gestureIsActive);

@property (nonatomic, copy) BOOL (^tappedSwipeButtonHandler)(MGSwipeTableCell *cell, NSInteger atIndex, MGSwipeDirection direction, BOOL fromExpansion);

@property (nonatomic, copy) NSArray<UIView *> *(^swipeButtonsHandler)(MGSwipeTableCell *cell, MGSwipeDirection direction, MGSwipeSettings *swipeSettings, MGSwipeExpansionSettings *expansionSettings);

@property (nonatomic, copy) BOOL (^shouldHideSwipeOnTapHandler)(MGSwipeTableCell *cell, CGPoint point);

@property (nonatomic, copy) void (^willBeginSwipingHandler)(MGSwipeTableCell *cell);

@property (nonatomic, copy) void (^willEndSwipingHandler)(MGSwipeTableCell *cell);


@property (nonatomic, weak, nullable) id<MGSwipeTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
