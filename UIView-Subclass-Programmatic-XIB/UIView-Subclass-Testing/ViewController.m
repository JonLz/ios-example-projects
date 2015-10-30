//
//  ViewController.m
//  UIView-Subclass-Testing
//
//  Created by Jon on 10/30/15.
//  Copyright © 2015 Second Wind, LLC. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#define MAS_SHORTHAND
#import "Masonry.h"
@interface ViewController ()
@property (nonatomic, strong) CustomView *customView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Programatically make a custom UIView
    self.customView = [[CustomView alloc] initWithColor:[UIColor greenColor]];
    [self.view addSubview:self.customView];
    
    [self.customView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(35);
        make.top.equalTo(self.view).with.offset(40);
        make.width.equalTo(self.view).multipliedBy(0.75);
        make.height.equalTo(@50);
    }];
    
}

-(void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    view.layer.mask = shape;
}

// Custom layout code to be applied after autolayout has completed so that the subviews have frames
-(void)viewDidLayoutSubviews
{
    [self setMaskTo:self.customView byRoundingCorners:UIRectCornerBottomRight | UIRectCornerBottomLeft];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
