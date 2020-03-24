#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HoloTableViewMGPlugin.h"
#import "HoloTableRowMaker+MGPlugin.h"
#import "HoloTableRowMGProxy.h"
#import "HoloTableRowMGProxyData.h"

FOUNDATION_EXPORT double HoloTableViewMGPluginVersionNumber;
FOUNDATION_EXPORT const unsigned char HoloTableViewMGPluginVersionString[];

