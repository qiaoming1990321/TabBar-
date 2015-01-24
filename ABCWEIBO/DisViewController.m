//
//  DisViewController.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-4.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "DisViewController.h"
#import "CustomSourchBar.h"

@interface DisViewController ()

@end

@implementation DisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    //设置Navigation上部的搜索框
//    UITextField *sourchField = [[UITextField alloc] init];
//    sourchField.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 20, 30);//不用设置point
//    sourchField.background = [UIImage imageNamed:@"searchbar_textfield_background_os7@2x"];
//    //设置左侧的放大镜
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon@2x"]];
//    imageView.frame = CGRectMake(0, 0, 50, 30);
//    imageView.contentMode = UIViewContentModeCenter;//图片居中.尺寸按原图片尺寸
//    sourchField.leftView = imageView;
//    sourchField.leftViewMode = UITextFieldViewModeAlways;
//    [imageView release];
    
    //设置Navigation上部的搜索框,封装在CustomSourchBar中
    CustomSourchBar *sourchBar = [CustomSourchBar customSourchBar];
    sourchBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 20, 30);
    self.navigationItem.titleView = sourchBar;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
