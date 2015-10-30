//
//  CustomView.m
//  UIView-Subclass-Testing
//
//  Created by Jon on 10/30/15.
//  Copyright © 2015 Second Wind, LLC. All rights reserved.
//

#import "CustomView.h"
#define MAS_SHORTHAND 
#import "Masonry.h"

@interface CustomView ()
@property (nonatomic, strong) UIView *customViewObject;
@property (nonatomic, strong) UIColor *color;

// Storyboard initialization only
@property (weak, nonatomic) IBOutlet UIView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end


@implementation CustomView


// Initializers for loading programatically
-(instancetype)initWithColor:(UIColor *)color
{
    self = [self initWithFrame:CGRectZero color:color];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame color:[UIColor orangeColor]];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.color = color;
        [self setupCustomViewObject];
    }
    return self;
}


// Initializer for Storyboard / IB
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        // Loads the custom xib file (must have same name as the class with this setup)
        // The first object is the first object of the xib's view hierarchy (a UIView here)
        // The owner of this UIView is the CustomView class
        // Now that our CustomView is loaded, we can set the properties using self.property etc.
        UIView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                      owner:self
                                    options:nil][0];
        
        self.backgroundColor = [UIColor orangeColor];
        self.textLabel.text = @"Changed via initWithCoder";
        
        [self addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
    return self;
}

// Custom setup
-(void)setupCustomViewObject
{
    self.customViewObject = [[UIView alloc] initWithFrame:CGRectZero];
    self.customViewObject.backgroundColor = self.color;
    
    [self addSubview:self.customViewObject];
    
    [self.customViewObject makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.size.equalTo(self).multipliedBy(0.5);
    }];
}


@end
