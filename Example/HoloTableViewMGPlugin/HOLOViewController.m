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

@property (nonatomic, copy) NSArray *modelArray;

@end

@implementation HOLOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    
    [self makeRowListWithDefaultSection];
//    [self makeSectionListByObject];
}



#pragma mark - Object

- (void)makeRowListWithDefaultSection {
    [self.tableView holo_makeRows:^(HoloTableViewRowMaker * _Nonnull make) {
        for (NSDictionary *dict in self.modelArray) {
            // example 1
            make.row(HoloExampleTableViewCell.class).model(dict)
            .canSwipe(YES)
            .makeSwipButtons(^(HoloTableRowMGMaker * _Nonnull make) {
                make.direction(MGSwipeDirectionLeftToRight).title(@"Left").backgroundColor(UIColor.redColor);
                make.direction(MGSwipeDirectionRightToLeft).title(@"Right").backgroundColor(UIColor.redColor);
                
                make.direction(MGSwipeDirectionRightToLeft).title(@"Right2").backgroundColor(UIColor.blueColor)
                .callback(^BOOL(MGSwipeTableCell * _Nonnull cell) {
                    NSLog(@"tag Right2 swip button");
                    return YES;
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

- (void)makeSectionListByObject {
    HoloTableSection *section = [HoloTableSection new];
    
    NSMutableArray *rows = [NSMutableArray new];
    for (NSDictionary *dict in self.modelArray) {
        HoloTableRow *row = [HoloTableRow new];
        row.cell = HoloExampleTableViewCell.class;
        row.model = dict;
        
        HoloTableRowMGAction *mgAction = [HoloTableRowMGAction new];
        mgAction.leftToRightButtons = @[[MGSwipeButton buttonWithTitle:dict[@"text"] backgroundColor:[UIColor redColor]]];
        mgAction.rightToLeftButtons = @[[MGSwipeButton buttonWithTitle:dict[@"text"] backgroundColor:[UIColor redColor]]];
        mgAction.willBeginSwipingHandler = ^(MGSwipeTableCell * _Nonnull cell) {
            NSLog(@"begin swiping: %@", cell);
        };
        mgAction.willEndSwipingHandler = ^(MGSwipeTableCell * _Nonnull cell) {
            NSLog(@"end swiping: %@", cell);
        };
        row.mgAction = mgAction;
        
        [rows addObject:row];
    }
    section.rows = rows;
    
    self.tableView.holo_sections = @[section];
    [self.tableView reloadData];
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

- (NSArray *)modelArray {
    if (!_modelArray) {
        _modelArray = @[
            @{@"bgColor": [UIColor yellowColor],   @"text": @"cell-1", @"height": @66},
            @{@"bgColor": [UIColor cyanColor],     @"text": @"cell-2", @"height": @66},
            @{@"bgColor": [UIColor orangeColor],   @"text": @"cell-3", @"height": @66},
        ];
    }
    return _modelArray;
}

@end
