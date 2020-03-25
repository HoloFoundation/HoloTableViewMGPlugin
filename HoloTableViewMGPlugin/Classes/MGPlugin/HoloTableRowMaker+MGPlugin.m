//
//  HoloTableRowMaker+MGPlugin.m
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2020/3/24.
//

#import "HoloTableRowMaker+MGPlugin.h"
#import <objc/runtime.h>
#import "HoloTableRowMGProxy.h"

static char kHoloTableRowMGProxyKey;

@interface HoloTableRowMaker ()

@property (nonatomic, strong) HoloTableRowMGProxy *mgProxy;

@end

@implementation HoloTableRowMaker (MGPlugin)

- (HoloTableRowMaker * (^)(BOOL (^)(MGSwipeTableCell *, MGSwipeDirection, CGPoint)))canSwipeHandler {
    return ^id(BOOL b) {
//        self.tableRow.targetMoveHandler = obj;
        return self;
    };
}

#pragma mark - getter
- (HoloTableRowMGProxy *)mgProxy {
    HoloTableRowMGProxy *proxy = objc_getAssociatedObject(self.tableRow, &kHoloTableRowMGProxyKey);
    if (!proxy) {
        proxy = [HoloTableRowMGProxy new];
        objc_setAssociatedObject(self.tableRow, &kHoloTableRowMGProxyKey, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        if (!self.tableRow.delegate) {
            self.tableRow.delegateSEL = @selector(setDelegate:);
            self.tableRow.delegate = proxy;
        }
    }
    return proxy;
}

@end
