//
//  HoloTableRowMGMaker.h
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2020/3/29.
//

#import <Foundation/Foundation.h>
#import <MGSwipeTableCell/MGSwipeTableCell.h>

NS_ASSUME_NONNULL_BEGIN


@interface HoloTableRowMGSwipeButtonMaker : NSObject

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^title)(NSString *title);

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^icon)(UIImage *icon);

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^backgroundColor)(UIColor *backgroundColor);

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^insets)(UIEdgeInsets insets);

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^callback)(MGSwipeButtonCallback callback);

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^buttonWidth)(CGFloat buttonWidth);

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^padding)(CGFloat padding);

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *centerIconOverText;

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^centerIconOverTextSpacing)(CGFloat centerIconOverTextSpacing);

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^tintColor)(UIColor *tintColor);

@end


@interface HoloTableRowMGMaker : NSObject

@property (nonatomic, copy, readonly) HoloTableRowMGSwipeButtonMaker *(^direction)(MGSwipeDirection direction);

- (NSArray<MGSwipeButton *> *)leftToRightButtonsInstall;

- (NSArray<MGSwipeButton *> *)rightToLeftButtonsInstall;

@end

NS_ASSUME_NONNULL_END
