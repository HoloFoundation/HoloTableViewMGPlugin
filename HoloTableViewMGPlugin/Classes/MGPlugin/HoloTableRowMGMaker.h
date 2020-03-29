//
//  HoloTableRowMGMaker.h
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2020/3/29.
//

#import <Foundation/Foundation.h>
@class MGSwipeButton;

NS_ASSUME_NONNULL_BEGIN


@interface HoloTableRowMGSwipeButtonMaker : NSObject

@property (nonatomic, strong, readonly) MGSwipeButton *swipeButton;


@end


@interface HoloTableRowMGMaker : NSObject


- (void)install;

@end

NS_ASSUME_NONNULL_END
