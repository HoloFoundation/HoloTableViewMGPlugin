# HoloTableViewMGPlugin

[![CI Status](https://img.shields.io/travis/gonghonglou/HoloTableViewMGPlugin.svg?style=flat)](https://travis-ci.org/gonghonglou/HoloTableViewMGPlugin)
[![Version](https://img.shields.io/cocoapods/v/HoloTableViewMGPlugin.svg?style=flat)](https://cocoapods.org/pods/HoloTableViewMGPlugin)
[![License](https://img.shields.io/cocoapods/l/HoloTableViewMGPlugin.svg?style=flat)](https://cocoapods.org/pods/HoloTableViewMGPlugin)
[![Platform](https://img.shields.io/cocoapods/p/HoloTableViewMGPlugin.svg?style=flat)](https://cocoapods.org/pods/HoloTableViewMGPlugin)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## What's for

HoloTableViewMGPlugin is a plugin for [HoloTableView](https://github.com/gonghonglou/HoloTableView) framework, which provide the swip actions support for [MGSwipeTableCell](https://github.com/MortimerGoro/MGSwipeTableCell).

By using HoloTableViewMGPlugin, you can use all the methods of MGSwipeTableCell with HoloTableRowMaker.

To use it, simply make sure you use MGSwipeTableCell and import this plugin.

## Usage

```objective-c
UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
[self.view addSubview:tableView];

[self.tableView holo_makeRows:^(HoloTableViewRowMaker * _Nonnull make) {
    make.row(OneTableViewCell.class).model(@{@"key":@"value1"})
    .canSwipeHandler(^BOOL(MGSwipeTableCell * _Nonnull cell, MGSwipeDirection direction, CGPoint fromPoint) {
        return YES;
    })
    .swipeButtonsHandler(^NSArray<UIView *> * _Nonnull(MGSwipeTableCell * _Nonnull cell, MGSwipeDirection direction, MGSwipeSettings * _Nonnull swipeSettings, MGSwipeExpansionSettings * _Nonnull expansionSettings) {
        if (direction == MGSwipeDirectionLeftToRight) {
            return @[[MGSwipeButton buttonWithTitle:@"Left" backgroundColor:[UIColor redColor]]];
        } else {
            return @[[MGSwipeButton buttonWithTitle:@"Right" backgroundColor:[UIColor redColor]]];
        }
    })
    .willBeginSwipingHandler(^(MGSwipeTableCell * _Nonnull cell) {
        NSLog(@"begin swiping: %@", cell);
    })
    .willEndSwipingHandler(^(MGSwipeTableCell * _Nonnull cell) {
        NSLog(@"end swiping: %@", cell);
    });
}];

[self.tableView reloadData];

// etc...
```

## Installation

HoloTableViewMGPlugin is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HoloTableViewMGPlugin'
```

## Author

gonghonglou, gonghonglou@icloud.com

## License

HoloTableViewMGPlugin is available under the MIT license. See the LICENSE file for more info.
