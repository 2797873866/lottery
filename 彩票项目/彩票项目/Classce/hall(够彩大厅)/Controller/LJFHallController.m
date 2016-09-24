//
//  LJFHallController.m
//  彩票项目
//
//  Created by ljf on 16/8/18.
//  Copyright © 2016年 LJF. All rights reserved.
//

#import "LJFHallController.h"

@interface LJFHallController ()

@end

@implementation LJFHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem BarbuttonWithTitle:@"标题" NormalImage:@"CS50_activity_image" HigImage:@"pushSettings" Target:self action:@selector(hehe) ];
    
    //添加右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarbuttonWithTitle:nil NormalImage:@"Mylottery_config" HigImage:nil Target:self action:@selector(PushViewControll)];
}


-(void)PushViewControll{
    
    UIViewController * ctr = [[UIViewController alloc] init];
    ctr.view.frame = [UIScreen mainScreen].bounds;
    ctr.view.backgroundColor = [UIColor redColor];
    
    [self.navigationController pushViewController:ctr animated:YES];
}

-(void)hehe{
    
    ljfLog(@"%s",__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
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
