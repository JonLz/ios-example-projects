//
//  ViewController.m
//  test-proj-blog-debugging
//
//  Created by Jon on 10/2/15.
//  Copyright © 2015 Second Wind, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self.scrollView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
//    [self.scrollView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
//    [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
//    [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
//    self.scrollView.backgroundColor = [UIColor orangeColor];
//    
//    [self.stackView.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor].active = YES;
//    [self.stackView.rightAnchor constraintEqualToAnchor:self.scrollView.rightAnchor].active = YES;
//    [self.stackView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
//    [self.stackView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:3].active = YES;
//    
//    self.stackView.backgroundColor = [UIColor blueColor];
//    
//    UIView *redView = [[UIView alloc] init];
//    redView.frame = CGRectMake(10, 10, 500, 500);
//    redView.backgroundColor = [UIColor redColor];
//    [self.stackView addSubview:redView];
    
}

//-(void)viewDidLayoutSubviews
//{
//    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
//    self.scrollView.contentOffset = CGPointZero;
//    NSLog(@"%@",NSStringFromCGRect(self.scrollView.frame));
//
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
