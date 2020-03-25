//
//  HoloExampleTableViewCell.m
//  HoloTableViewMGPlugin_Example
//
//  Created by 与佳期 on 2020/3/26.
//  Copyright © 2020 gonghonglou. All rights reserved.
//

#import "HoloExampleTableViewCell.h"

@implementation HoloExampleTableViewCell

- (void)holo_configureCellWithModel:(NSDictionary *)model {
    self.backgroundColor = model[@"bgColor"];
    self.textLabel.text = model[@"text"];
}

+ (CGFloat)holo_heightForCellWithModel:(NSDictionary *)model {
    return [model[@"height"] floatValue];
}

@end
