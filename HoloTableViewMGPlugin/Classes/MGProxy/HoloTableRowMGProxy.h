//
//  HoloTableRowMGProxy.h
//  HoloTableView
//
//  Created by 与佳期 on 2020/3/24.
//

#import <Foundation/Foundation.h>
#import <MGSwipeTableCell/MGSwipeTableCell.h>
@class HoloTableRowMGAction;

NS_ASSUME_NONNULL_BEGIN

@interface HoloTableRowMGProxy : NSObject <MGSwipeTableCellDelegate>

@property (nonatomic, strong) HoloTableRowMGAction *action;

@end

NS_ASSUME_NONNULL_END
