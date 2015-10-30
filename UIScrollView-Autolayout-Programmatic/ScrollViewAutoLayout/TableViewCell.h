//
//  TableViewCell.h
//  ScrollViewAutoLayout
//
//  Created by Jon on 10/28/15.
//  Copyright © 2015 Flatiron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell  <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
