//
//  ViewController.m
//  stack-view-code
//
//  Created by Jon on 10/29/15.
//  Copyright © 2015 Second Wind, LLC. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageWithColor.h"

@interface ViewController ()
@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) NSArray *imagesArray;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.stackView = [[UIStackView alloc] init];
    self.imagesArray = [self arrayOfColoredImages];
    [self constrainStackView];
    [self addImagesToStackView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)constrainStackView
{
    [self.view addSubview:self.stackView];
    
    [self.stackView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.stackView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.stackView.heightAnchor constraintEqualToConstant:100].active = YES;
    [self.stackView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution = UIStackViewDistributionFillEqually;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;

    self.stackView.backgroundColor = [UIColor blackColor];

}

-(void)addImagesToStackView
{
    for (UIImage *image in self.imagesArray)
    {
        UIImageView *view = [[UIImageView alloc] initWithImage:image];
        [self.stackView addArrangedSubview:view];
    }
    
    UIImageView *firstImageView = [self.stackView subviews][0];
    [firstImageView.heightAnchor constraintEqualToConstant:100].active = YES;
    [firstImageView.widthAnchor constraintEqualToConstant:50].active = YES;

}

-(NSArray *)arrayOfColoredImages
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i=0 ; i<5; i++) {
        [array addObject:[self coloredImage]];
    }
    return array;
}

-(UIImage *)coloredImage
{
    CGFloat red = arc4random() % 255;
    CGFloat green = arc4random() % 255;
    CGFloat blue = arc4random() % 255;
    UIImage *coloredImage = [UIImage imageWithColor:[UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0f] size:CGSizeMake(100, 100)];
    return coloredImage;
}

@end
