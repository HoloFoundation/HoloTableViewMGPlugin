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
        self.swipeButton = [MGSwipeButton buttonWithType:UIButtonTypeCustom];
        self.swipeButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.swipeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.swipeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.swipeButton setEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
        [self.swipeButton sizeToFit];
    }
    return self;
}

- (HoloTableRowMGSwipeButtonMaker * (^)(NSString *))title {
    return ^(id obj) {
        [self.swipeButton setTitle:obj forState:UIControlStateNormal];
        [self.swipeButton sizeToFit];
        return self;
    };
}

- (HoloTableRowMGSwipeButtonMaker * (^)(UIImage *))icon {
    return ^(id obj) {
        [self.swipeButton setImage:obj forState:UIControlStateNormal];
        return self;
    };
}

- (HoloTableRowMGSwipeButtonMaker * (^)(UIColor *))backgroundColor {
    return ^(id obj) {
        self.swipeButton.backgroundColor = obj;
        return self;
    };
}

- (HoloTableRowMGSwipeButtonMaker * (^)(UIEdgeInsets))insets {
    return ^(UIEdgeInsets insets) {
        [self.swipeButton setEdgeInsets:insets];
        return self;
    };
}

- (HoloTableRowMGSwipeButtonMaker * (^)(MGSwipeButtonCallback))callback {
    return ^(MGSwipeButtonCallback callback) {
        self.swipeButton.callback = callback;
        return self;
    };
}

- (HoloTableRowMGSwipeButtonMaker * (^)(CGFloat))buttonWidth {
    return ^(CGFloat f) {
        self.swipeButton.buttonWidth = f;
        return self;
    };
}

- (HoloTableRowMGSwipeButtonMaker * (^)(CGFloat))padding {
    return ^(CGFloat f) {
        [self.swipeButton setPadding:f];
        return self;
    };
}

- (HoloTableRowMGSwipeButtonMaker *)centerIconOverText {
    [self.swipeButton centerIconOverText];
    return self;
}

- (HoloTableRowMGSwipeButtonMaker * (^)(CGFloat))centerIconOverTextSpacing {
    return ^(CGFloat f) {
        [self.swipeButton centerIconOverTextWithSpacing:f];
        return self;
    };
}

- (HoloTableRowMGSwipeButtonMaker * (^)(UIColor *))tintColor {
    return ^(id obj) {
        [self.swipeButton iconTintColor:obj];
        return self;
    };
}

@end


@interface HoloTableRowMGMaker ()

@property (nonatomic, strong) NSMutableArray<MGSwipeButton *> *leftToRightButtons;

@property (nonatomic, strong) NSMutableArray<MGSwipeButton *> *rightToLeftButtons;

@end

@implementation HoloTableRowMGMaker

- (HoloTableRowMGSwipeButtonMaker * (^)(MGSwipeDirection))direction {
    return ^id(MGSwipeDirection direction) {
        HoloTableRowMGSwipeButtonMaker *buttonMaker = [HoloTableRowMGSwipeButtonMaker new];
        if (direction == MGSwipeDirectionLeftToRight) {
            [self.leftToRightButtons addObject:buttonMaker.swipeButton];
        } else {
            [self.rightToLeftButtons addObject:buttonMaker.swipeButton];
        }
        return buttonMaker;
    };
}

- (NSArray<MGSwipeButton *> *)leftToRightButtonsInstall {
    return self.leftToRightButtons.copy;
}

- (NSArray<MGSwipeButton *> *)rightToLeftButtonsInstall {
    return self.rightToLeftButtons.copy;
}

#pragma mark - getter
- (NSMutableArray<MGSwipeButton *> *)leftToRightButtons {
    if (!_leftToRightButtons) {
        _leftToRightButtons = [NSMutableArray new];
    }
    return _leftToRightButtons;
}

- (NSMutableArray<MGSwipeButton *> *)rightToLeftButtons {
    if (!_rightToLeftButtons) {
        _rightToLeftButtons = [NSMutableArray new];
    }
    return _rightToLeftButtons;
}

@end
