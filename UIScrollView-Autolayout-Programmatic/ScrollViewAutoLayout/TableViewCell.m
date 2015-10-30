//
//  TableViewCell.m
//  ScrollViewAutoLayout
//
//  Created by Jon on 10/28/15.
//  Copyright © 2015 Flatiron. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%@",NSStringFromCGSize(scrollView.contentSize));
}

@end
