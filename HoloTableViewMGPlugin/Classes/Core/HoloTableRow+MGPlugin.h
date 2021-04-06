//
//  HoloTableRow+MGPlugin.h
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2021/4/6.
//

#import <HoloTableView/HoloTableView.h>
@class HoloTableRowMGAction, HoloTableRowMGProxy;

NS_ASSUME_NONNULL_BEGIN

@interface HoloTableRow (MGPlugin)

/// Careating your own HoloTableRowMGAction or change current object to support MGSwipeTableCell.
@property (nonatomic, strong) HoloTableRowMGAction *mgAction;

/// Proxy of current HoloTableRow.
@property (nonatomic, strong) HoloTableRowMGProxy *mgProxy;

@end

NS_ASSUME_NONNULL_END
