//
//  HoloTableRowMaker+MGPlugin.h
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2020/3/24.
//

#import <HoloTableView/HoloTableView.h>
#import <MGSwipeTableCell/MGSwipeTableCell.h>
@class HoloTableRowMGMaker;

NS_ASSUME_NONNULL_BEGIN

@interface HoloTableRowMaker (MGPlugin)

/// Delegate method to enable/disable swipe gestures
/// @return YES if swipe is allowed
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^canSwipeHandler)(BOOL (^canSwipe)(MGSwipeTableCell *cell, MGSwipeDirection direction, CGPoint fromPoint));

/// Delegate method invoked when the current swipe state changes
/// @param state the current Swipe State
/// @param gestureIsActive YES if the user swipe gesture is active. No if the uses has already ended the gesture
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^didChangeSwipeHandler)(void(^)(MGSwipeTableCell *cell, MGSwipeState state, BOOL gestureIsActive));

/// Called when the user clicks a swipe button or when a expandable button is automatically triggered
/// @return YES to autohide the current swipe buttons
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^tappedSwipeButtonHandler)(BOOL (^tappedSwipeButton)(MGSwipeTableCell *cell, NSInteger atIndex, MGSwipeDirection direction, BOOL fromExpansion));

/// Delegate method to setup the swipe buttons and swipe/expansion settings
/// Buttons can be any kind of UIView but it's recommended to use the convenience MGSwipeButton class
/// Setting up buttons with this delegate instead of using cell properties improves memory usage because buttons are only created in demand
/// @param cell the UITableViewCell to configure. You can get the indexPath using [tableView indexPathForCell:cell]
/// @param direction The swipe direction (left to right or right to left)
/// @param swipeSettings instance to configure the swipe transition and setting (optional)
/// @param expansionSettings instance to configure button expansions (optional)
/// @return Buttons array
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^swipeButtonsHandler)(NSArray<UIView *> *(^swipeButtons)(MGSwipeTableCell *cell, MGSwipeDirection direction, MGSwipeSettings *swipeSettings, MGSwipeExpansionSettings *expansionSettings));

/// Called when the user taps on a swiped cell
/// @return YES to autohide the current swipe buttons
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^shouldHideSwipeOnTapHandler)(BOOL (^shouldHideSwipe)(MGSwipeTableCell *cell, CGPoint point));

/// Called when the cell will begin swiping
/// Useful to make cell changes that only are shown after the cell is swiped open
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^willBeginSwipingHandler)(void(^)(MGSwipeTableCell *cell));

/// Called when the cell will end swiping
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^willEndSwipingHandler)(void(^)(MGSwipeTableCell *cell));


/// If canSwipeHandler is nil, use the value
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^canSwipe)(BOOL canSwipe);

/// If tappedSwipeButtonHandler is nil, use the value
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^tappedSwipeButton)(BOOL tappedSwipeButton);

/// If shouldHideSwipeOnTapHandler is nil, use the value
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^shouldHideSwipeOnTap)(BOOL shouldHideSwipe);

/// If swipeButtonsHandler is nil, use the value
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^makeSwipButtons)(void(NS_NOESCAPE ^)(HoloTableRowMGMaker *make));

/// You can implement MGSwipeTableCellDelegate by setting the delegate
@property (nonatomic, copy, readonly) HoloTableRowMaker *(^delegate)(id<MGSwipeTableCellDelegate> delegate);

@end

NS_ASSUME_NONNULL_END
