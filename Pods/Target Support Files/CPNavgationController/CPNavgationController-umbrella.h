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

#import "CPNavgationController.h"
#import "CPWrapNavgationController.h"
#import "CPWrapViewController.h"
#import "NSBundle+CPNavgationController.h"
#import "UIViewController+CPNavgationExtension.h"

FOUNDATION_EXPORT double CPNavgationControllerVersionNumber;
FOUNDATION_EXPORT const unsigned char CPNavgationControllerVersionString[];

