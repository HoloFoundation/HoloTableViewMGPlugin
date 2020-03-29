//
//  HoloTableRowMGMaker.m
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2020/3/29.
//

#import "HoloTableRowMGMaker.h"

@interface HoloTableRowMGSwipeButtonMaker ()

@property (nonatomic, strong) MGSwipeButton *swipeButton;

@end

@implementation HoloTableRowMGSwipeButtonMaker

- (instancetype)init {
    self = [super init];
    if (self) {
        self.swipeButton = [MGSwipeButton new];
    }
    return self;
}

@end


@interface HoloTableRowMGMaker ()

@property (nonatomic, strong) NSMutableArray<HoloTableRowMGSwipeButtonMaker *> *leftToRightButtons;

@property (nonatomic, strong) NSMutableArray<HoloTableRowMGSwipeButtonMaker *> *rightToLeftButtons;

@end

@implementation HoloTableRowMGMaker

- (HoloTableRowMGSwipeButtonMaker * (^)(MGSwipeDirection))direction {
    return ^id(MGSwipeDirection direction) {
        HoloTableRowMGSwipeButtonMaker *buttonMaker = [HoloTableRowMGSwipeButtonMaker new];
        if (direction == MGSwipeDirectionLeftToRight) {
            [self.leftToRightButtons addObject:buttonMaker];
        } else {
            [self.rightToLeftButtons addObject:buttonMaker];
        }
        return buttonMaker;
    };
}

- (void)install {
    
}

#pragma mark - getter
- (NSMutableArray<HoloTableRowMGSwipeButtonMaker *> *)leftToRightButtons {
    if (!_leftToRightButtons) {
        _leftToRightButtons = [NSMutableArray new];
    }
    return _leftToRightButtons;
}

- (NSMutableArray<HoloTableRowMGSwipeButtonMaker *> *)rightToLeftButtons {
    if (!_rightToLeftButtons) {
        _rightToLeftButtons = [NSMutableArray new];
    }
    return _rightToLeftButtons;
}

@end
