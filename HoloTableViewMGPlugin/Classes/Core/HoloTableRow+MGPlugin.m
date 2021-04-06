//
//  HoloTableRow+MGPlugin.m
//  HoloTableViewMGPlugin
//
//  Created by 与佳期 on 2021/4/6.
//

#import "HoloTableRow+MGPlugin.h"
#import <objc/runtime.h>
#import "HoloTableRowMGProxy.h"

static char kHoloTableRowMGProxyKey;

@implementation HoloTableRow (MGPlugin)

- (HoloTableRowMGAction *)mgAction {
    return self.mgProxy.action;
}

- (void)setMgAction:(HoloTableRowMGAction *)mgAction {
    self.mgProxy.action = mgAction;
}

- (HoloTableRowMGProxy *)mgProxy {
    HoloTableRowMGProxy *mgProxy = objc_getAssociatedObject(self, &kHoloTableRowMGProxyKey);
    if (!mgProxy) {
        mgProxy = [HoloTableRowMGProxy new];
        objc_setAssociatedObject(self, &kHoloTableRowMGProxyKey, mgProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        self.delegateSEL = @selector(setDelegate:);
        self.delegate = mgProxy;
    }
    return mgProxy;
}

- (void)setMgProxy:(HoloTableRowMGProxy *)mgProxy {
    objc_setAssociatedObject(self, &kHoloTableRowMGProxyKey, mgProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.delegateSEL = @selector(setDelegate:);
    self.delegate = mgProxy;
}

@end
