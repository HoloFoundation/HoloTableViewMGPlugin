//
//  HoloTableRowMaker+MGPlugin.h
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2020/3/24.
//

#import <HoloTableView/HoloTableView.h>
#import <MGSwipeTableCell/MGSwipeTableCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface HoloTableRowMaker (MGPlugin)

@property (nonatomic, copy, readonly) HoloTableRowMaker *(^canSwipeHandler)(BOOL (^canSwipe)(MGSwipeTableCell *cell, MGSwipeDirection direction, CGPoint fromPoint));

@end

NS_ASSUME_NONNULL_END
