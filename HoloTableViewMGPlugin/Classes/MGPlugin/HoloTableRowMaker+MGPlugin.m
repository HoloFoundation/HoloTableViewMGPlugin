//
//  HoloTableRowMaker+MGPlugin.m
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2020/3/24.
//

#import "HoloTableRowMaker+MGPlugin.h"
#import <objc/runtime.h>
#import <HoloTableView/HoloTableRow.h>
#import "HoloTableRowMGProxy.h"
#import "HoloTableRowMGAction.h"
#import "HoloTableRowMGMaker.h"

static char kHoloTableRowMGProxyKey;

@interface HoloTableRowMaker ()

@property (nonatomic, strong) HoloTableRowMGProxy *proxy;

@end

@implementation HoloTableRowMaker (MGPlugin)

- (HoloTableRowMaker * (^)(BOOL (^)(MGSwipeTableCell *, MGSwipeDirection, CGPoint)))canSwipeHandler {
    return ^id(id obj) {
        self.proxy.action.canSwipeHandler = obj;
        return self;
    };
}

- (HoloTableRowMaker * (^)(void (^)(MGSwipeTableCell *, MGSwipeState, BOOL)))didChangeSwipeHandler {
    return ^id(id obj) {
        self.proxy.action.didChangeSwipeHandler = obj;
        return self;
    };
}

- (HoloTableRowMaker * (^)(BOOL (^)(MGSwipeTableCell *, NSInteger, MGSwipeDirection, BOOL)))tappedSwipeButtonHandler {
    return ^id(id obj) {
        self.proxy.action.tappedSwipeButtonHandler = obj;
        return self;
    };
}

- (HoloTableRowMaker * (^)(NSArray<UIView *> * (^)(MGSwipeTableCell *, MGSwipeDirection, MGSwipeSettings *, MGSwipeExpansionSettings *)))swipeButtonsHandler {
    return ^id(id obj) {
        self.proxy.action.swipeButtonsHandler = obj;
        return self;
    };
}

- (HoloTableRowMaker * (^)(BOOL (^)(MGSwipeTableCell *, CGPoint)))shouldHideSwipeOnTapHandler {
    return ^id(id obj) {
        self.proxy.action.shouldHideSwipeOnTapHandler = obj;
        return self;
    };
}

- (HoloTableRowMaker * (^)(void (^)(MGSwipeTableCell *)))willBeginSwipingHandler {
    return ^id(id obj) {
        self.proxy.action.willBeginSwipingHandler = obj;
        return self;
    };
}

- (HoloTableRowMaker * (^)(void (^)(MGSwipeTableCell *)))willEndSwipingHandler {
    return ^id(id obj) {
        self.proxy.action.willEndSwipingHandler = obj;
        return self;
    };
}


- (HoloTableRowMaker * (^)(BOOL))canSwipe {
    return ^id(BOOL b) {
        self.proxy.action.canSwipe = b;
        return self;
    };
}

- (HoloTableRowMaker * (^)(BOOL))tappedSwipeButton {
    return ^id(BOOL b) {
        self.proxy.action.tappedSwipeButton = b;
        return self;
    };
}

- (HoloTableRowMaker * (^)(BOOL))shouldHideSwipeOnTap {
    return ^id(BOOL b) {
        self.proxy.action.shouldHideSwipeOnTap = b;
        return self;
    };
}

- (HoloTableRowMaker * (^)(NS_NOESCAPE void (^)(HoloTableRowMGMaker *)))makeSwipButtons {
    return ^id(void(^block)(HoloTableRowMGMaker *make)) {
        HoloTableRowMGMaker *maker = [HoloTableRowMGMaker new];
        if (block) block(maker);
        self.proxy.action.leftToRightButtons = [maker leftToRightButtonsInstall];
        self.proxy.action.rightToLeftButtons = [maker rightToLeftButtonsInstall];
        return self;
    };
}

- (HoloTableRowMaker * (^)(id<MGSwipeTableCellDelegate>))delegate {
    return ^id(id obj) {
        self.proxy.action.delegate = obj;
        return self;
    };
}

#pragma mark - getter
- (HoloTableRowMGProxy *)proxy {
    HoloTableRow *tableRow = [self fetchTableRow];
    HoloTableRowMGProxy *mgProxy = objc_getAssociatedObject(tableRow, &kHoloTableRowMGProxyKey);
    if (!mgProxy) {
        mgProxy = [HoloTableRowMGProxy new];
        objc_setAssociatedObject(tableRow, &kHoloTableRowMGProxyKey, mgProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        tableRow.delegateSEL = @selector(setDelegate:);
        tableRow.delegate = mgProxy;
    }
    return mgProxy;
}

@end
