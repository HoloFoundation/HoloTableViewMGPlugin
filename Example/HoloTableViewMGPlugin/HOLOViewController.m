//
//  HOLOViewController.m
//  HoloTableViewMGPlugin
//
//  Created by gonghonglou on 03/24/2020.
//  Copyright (c) 2020 gonghonglou. All rights reserved.
//

#import "HOLOViewController.h"
#import <HoloTableView/HoloTableView.h>
#import <HoloTableViewMGPlugin/HoloTableViewMGPlugin.h>
#import "HoloExampleTableViewCell.h"

#define HOLO_SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define HOLO_SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height

@interface HOLOViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HOLOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    [self.tableView holo_makeRows:^(HoloTableViewRowMaker * _Nonnull make) {
        for (NSDictionary *dict in [self _modelsFromOtherWay]) {
            // example 1
            make.row(HoloExampleTableViewCell.class).model(dict)
            .canSwipe(YES)
            .makeSwipButtons(^(HoloTableRowMGMaker * _Nonnull make) {
                make.direction(MGSwipeDirectionLeftToRight).title(@"Left").backgroundColor(UIColor.redColor)
                .callback(^BOOL(MGSwipeTableCell * _Nonnull cell) {
                    NSLog(@"selected Left swip button");
                    return YES;
                });
                
                make.direction(MGSwipeDirectionRightToLeft).title(@"Right").backgroundColor(UIColor.redColor)
                .callback(^BOOL(MGSwipeTableCell * _Nonnull cell) {
                    NSLog(@"selected Right swip button");
                    return NO;
                });
            });
            
            // example 2
            make.row(HoloExampleTableViewCell.class).model(dict)
            .canSwipeHandler(^BOOL(MGSwipeTableCell * _Nonnull cell, MGSwipeDirection direction, CGPoint fromPoint) {
                return YES;
            })
            .swipeButtonsHandler(^NSArray<UIView *> * _Nonnull(MGSwipeTableCell * _Nonnull cell, MGSwipeDirection direction, MGSwipeSettings * _Nonnull swipeSettings, MGSwipeExpansionSettings * _Nonnull expansionSettings) {
                if (direction == MGSwipeDirectionLeftToRight) {
                    return @[[MGSwipeButton buttonWithTitle:dict[@"text"] backgroundColor:[UIColor redColor]]];
                } else {
                    return @[[MGSwipeButton buttonWithTitle:dict[@"text"] backgroundColor:[UIColor redColor]]];
                }
            })
            .willBeginSwipingHandler(^(MGSwipeTableCell * _Nonnull cell) {
                NSLog(@"begin swiping: %@", cell);
            })
            .willEndSwipingHandler(^(MGSwipeTableCell * _Nonnull cell) {
                NSLog(@"end swiping: %@", cell);
            });
        }
    }];
    
    [self.tableView reloadData];
}

- (NSArray *)_modelsFromOtherWay {
    return @[
        @{@"bgColor": [UIColor yellowColor],   @"text": @"cell-1", @"height": @66},
        @{@"bgColor": [UIColor cyanColor],     @"text": @"cell-2", @"height": @66},
        @{@"bgColor": [UIColor orangeColor],   @"text": @"cell-3", @"height": @66},
    ];
}

#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        CGRect frame = CGRectMake(0, 100, HOLO_SCREEN_WIDTH, HOLO_SCREEN_HEIGHT - 100);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}

@end
