//
//  ScrollViewTableViewCell.m
//  ScrollViewAutoLayout
//
//  Created by Jon on 10/29/15.
//  Copyright © 2015 Flatiron. All rights reserved.
//

#import "ScrollViewTableViewCell.h"
#define MAS_SHORTHAND
#import "Masonry.h"

@interface ScrollViewTableViewCell ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation ScrollViewTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.scrollView = [[UIScrollView alloc] init];
        self.containerView = [[UIView alloc] init];
        self.stackView = [[UIStackView alloc] init];
        [self constrainScrollView];
        [self constrainContainerView];
        [self constrainStackView];
    }
    return self;
}

-(void)constrainScrollView
{
    [self.contentView addSubview:self.scrollView];

    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    self.scrollView.layer.borderColor = [UIColor redColor].CGColor;
    self.scrollView.layer.borderWidth = 1;
}

-(void)constrainContainerView
{
    [self.scrollView addSubview:self.containerView];

    [self.containerView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.contentView);
//        make.width.equalTo(self.contentView);
    }];
}

-(void)constrainStackView
{
    [self.containerView addSubview:self.stackView];

    [self.stackView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
        make.height.equalTo(self.containerView);
    }];
    
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution = UIStackViewDistributionFillEqually;

}


-(void)addImagesToStackView
{
    for (UIImage *image in self.imagesArray)
    {
        UIImageView *view = [[UIImageView alloc] initWithImage:image];
        [self.stackView addArrangedSubview:view];
    }
    
    UIImageView *firstImageView = [self.stackView subviews][0];
    [firstImageView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.containerView);
        make.width.equalTo(@150);
    }];
}

-(void)setImagesArray:(NSArray *)imagesArray
{
    if (!_imagesArray) {
        _imagesArray = imagesArray;
        [self addImagesToStackView];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
