//
//  XBaseChartConfiguration.m
//  XJYChart
//
//  Created by JunyiXie on 2017/12/3.
//  Copyright © 2017年 JunyiXie. All rights reserved.
//

#import "XBaseChartConfiguration.h"
#import "XColor.h"

@implementation XBaseChartConfiguration

- (instancetype)init {
  if (self = [super init]) {
    self.chartBackgroundColor = XJYWhite;
    self.ordinateDenominator = 4;
    self.isScrollable = YES;
    self.isEnableNumberAnimation = YES;
    self.isShowOrdinate = YES;
    self.isShowXAbscissa = YES;
      self.lineWidth = 1.f;
      self.titlesColor = [UIColor blackColor];
      self.titlesFont = [UIFont systemFontOfSize:12.f];
  }
  return self;
}
@end
