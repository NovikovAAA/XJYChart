//
//  HomeFiveTableViewCell.m
//  RecordLife
//
//  Created by 谢俊逸 on 17/03/2017.
//  Copyright © 2017 谢俊逸. All rights reserved.
//

#import "LineChartCell.h"
#import <XJYChart/XJYChart.h>

@interface LineChartCell() <XLineChartDelegate>

@end

@implementation LineChartCell

- (void)awakeFromNib {
  [super awakeFromNib];
  // Initialization code
    self.backgroundColor = [UIColor purpleColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString*)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    NSMutableArray* itemArray = [[NSMutableArray alloc] init];

    NSMutableArray* numbersArray = [NSMutableArray new];

    //点的数据
    for (int j = 0; j < 2; j++) {
      NSMutableArray* numberArray = [NSMutableArray new];

      for (int i = 0; i < 10; i++) {
        int num = [[XRandomNumerHelper shareRandomNumberHelper]
                      randomNumberSmallThan:14] *
                  [[XRandomNumerHelper shareRandomNumberHelper]
                      randomNumberSmallThan:14];
        NSNumber* number = [NSNumber numberWithInt:num];
        [numberArray addObject:number];
      }

      [numbersArray addObject:numberArray];
    }

    NSArray* colorArray = @[
      [UIColor tealColor], [UIColor brickRedColor], [UIColor babyBlueColor],
      [UIColor bananaColor], [UIColor orchidColor]
    ];

    for (int i = 0; i < 2; i++) {
      XLineChartItem* item =
          [[XLineChartItem alloc] initWithDataNumberArray:numbersArray[i]
                                                    color:colorArray[i]];
      [itemArray addObject:item];
    }

    XNormalLineChartConfiguration* configuration =
        [[XNormalLineChartConfiguration alloc] init];
    configuration.lineMode = Straight;
    configuration.isScrollable = NO;
      configuration.isShowPoint = NO;
      configuration.indicatorLineColor = [UIColor lightGrayColor];
      configuration.lineWidth = 2.f;
      configuration.auxiliaryDashLineColor = [UIColor redColor];
      configuration.ordinateTitles = @[@"ONE", @"TWO", @"TREE"];

    XLineChart* lineChart =
        [[XLineChart alloc] initWithFrame:CGRectMake(0, 0, 375, 200)
                            dataItemArray:itemArray
                        dataDiscribeArray:[NSMutableArray arrayWithArray:@[
                          @"January", @"February", @"March", @"April", @"May"
                        ]]
                                topNumber:@240
                             bottomNumber:@0
                                graphMode:MutiLineGraph
                       chartConfiguration:configuration];
    [self.contentView addSubview:lineChart];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
      lineChart.delegate = self;
  }
  return self;
}

#pragma mark - XLineChartDelegate

- (BOOL)canHighlightPointAtIndex:(NSInteger)pointIndex forLineAtIndex:(NSInteger)lineIndex {
//    return pointIndex != 4 && pointIndex != 5 ;
    
    if (lineIndex == 0) {
        return pointIndex != 4 && pointIndex != 5 ;
    } else {
        return pointIndex != 0 && pointIndex != 1
        ;
    }
}

-(void)lineChart:(XLineChart *)chart didMoveTouchWithPoint:(CGPoint)point {
    UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 50.f, 50.f)];
    view.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:view];
}

-(void)lineChart:(XLineChart *)chart didSelectChartsPointsWithInfo:(NSDictionary *)info {
    CGPoint touch = [((NSValue *) info[kLineChartTouchInfoKey]) CGPointValue];
    
    NSLog(@"TOUCH: %@", NSStringFromCGPoint(touch));
}

@end
