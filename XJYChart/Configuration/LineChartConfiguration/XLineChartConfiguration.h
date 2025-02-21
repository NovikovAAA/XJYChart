//
//  XLineChartConfiguration.h
//  XJYChart
//
//  Created by JunyiXie on 2017/12/3.
//  Copyright © 2017年 JunyiXie. All rights reserved.
//

#import "XBaseChartConfiguration.h"
#import "XEnumHeader.h"

@interface XLineChartConfiguration : XBaseChartConfiguration

/**
 Line Mode
 - Straight
 - CurveLine

 Default is Straight

 */
@property(nonatomic, assign) XLineMode lineMode;

@property (nonatomic, assign) XLineChartOrdinateMode ordinateMode;

@property (nonatomic, assign) XLineChartBackground background;

/// defalut is [UIColor black75PercentColor]
@property(nonatomic, strong) UIColor* auxiliaryDashLineColor;
@property (nonatomic, assign) CGFloat auxiliaryDashLineWidth;

@property (nonatomic, strong) UIColor *indicatorLineColor;
@property (nonatomic, assign) CGFloat indicatorLineWidth;

/// defalut is YES
@property(nonatomic, assign) BOOL isShowAuxiliaryDashLine;

/// if enable number
/// ,touch height failure
@property(nonatomic, assign) BOOL isEnableNumberLabel;

@property(nonatomic, strong) UIColor *numberLabelColor;
@property(nonatomic, assign) BOOL isEnableTouchShowNumberLabel;

@property (nonatomic, assign) CGFloat ordinateViewWidth;

@end
