//
//  HomeViewController.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-3.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "HomeViewController.h"
#import "UIBarButtonItem+MQ.h"
#import "CustomHomeButton.h"

static NSString *ID = @"cell";
@interface HomeViewController ()

{
    BOOL flag;
}

@end

@implementation HomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //设置两侧按钮
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_friendsearch_os7@2x"] forState:UIControlStateNormal];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted_os7@2x"] forState:UIControlStateHighlighted];
//    //设置位置,遇到left,right,center等都不需要设置坐标,官方会自动摆到需要的位置
//    leftButton.bounds = CGRectMake(0, 0, leftButton.currentBackgroundImage.size.width, leftButton.currentBackgroundImage.size.height);
//    [leftButton addTarget:self action:@selector(findFriend) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftButton] autorelease];
//    
//    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_pop_os7@2x"] forState:UIControlStateNormal];
//    [rightButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_pop_highlighted_os7@2x"] forState:UIControlStateHighlighted];
//    rightButton.bounds = CGRectMake(0, 0, rightButton.currentBackgroundImage.size.width, rightButton.currentBackgroundImage.size.height);
//    [rightButton addTarget:self action:@selector(sweep) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:rightButton] autorelease];
    
    
    //设置两侧按钮,封装到分类里面去做
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithIcon:@"navigationbar_friendsearch_os7@2x" highlihtedIcon:@"navigationbar_friendsearch_highlighted_os7@2x" target:self action:@selector(findFriend)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithIcon:@"navigationbar_pop_os7@2x" highlihtedIcon:@"navigationbar_pop_highlighted_os7@2x" target:self action:@selector(sweep)];
    
    //设置中间按钮
    CustomHomeButton *customButton = [[CustomHomeButton alloc] init];
    customButton.frame = CGRectMake(0, 0, 120, 40);
    [customButton setTitle:@"QM的微博" forState:UIControlStateNormal];
    [customButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down_os7@2x"] forState:UIControlStateNormal];
    [customButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = customButton;
    [customButton release];
    
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

- (void)pressButton:(CustomHomeButton *)button
{
    if (flag) {
        [button setImage:[UIImage imageNamed:@"navigationbar_arrow_down_os7@2x"] forState:UIControlStateNormal];
        flag = NO;
    } else {
        [button setImage:[UIImage imageNamed:@"navigationbar_arrow_up_os7@2x"] forState:UIControlStateNormal];
        flag = YES;
    }
}

- (void)findFriend
{
    
}

- (void)sweep
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID     forIndexPath:indexPath];
    
    // Configure the cell...
    
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
