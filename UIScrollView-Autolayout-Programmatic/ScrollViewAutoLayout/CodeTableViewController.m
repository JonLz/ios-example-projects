//
//  CodeTableViewController.m
//  ScrollViewAutoLayout
//
//  Created by Jon on 10/29/15.
//  Copyright © 2015 Flatiron. All rights reserved.
//

#import "CodeTableViewController.h"
#import "ScrollViewTableViewCell.h"
#import "UIImage+ImageWithColor.h"

@interface CodeTableViewController ()
@property (nonatomic, strong) NSArray *imageArrays;
@end

@implementation CodeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ScrollViewTableViewCell class] forCellReuseIdentifier:@"scrollViewCell"];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ScrollViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scrollViewCell" forIndexPath:indexPath];
    cell.imagesArray = [self arrayOfColoredImages];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
