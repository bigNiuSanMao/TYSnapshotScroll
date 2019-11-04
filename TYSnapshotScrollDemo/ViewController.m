//
//  ViewController.m
//  TYSnapshotScroll
//
//  Created by Tony on 2016/7/11.
//  Copyright © 2016年 TonyReet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<
    UIWebViewDelegate
>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,copy) NSArray *dataSourceArr;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];


    self.dataSourceArr = @[@"UIWebView_截图",@"UITableView_截图",@"WKWebView_截图",@"UIScrollView_截图",@"UICollectionView_截图",@"UIScrollView嵌套UITableView_截图"];
    
    [self tableViewInit];
}


-(void )tableViewInit{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    self.tableView.delegate = (id)self;
    self.tableView.dataSource = (id)self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    [self.tableView reloadData];
}


#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ViewControllerCell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataSourceArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *nextVc;
    if (indexPath.row == 0) {
        nextVc = [NSClassFromString(@"TYWebViewVc") new];
        
    }else if(indexPath.row == 1){
        nextVc = [NSClassFromString(@"TYTableViewVc") new];
    }else if(indexPath.row == 2){
        nextVc = [NSClassFromString(@"TYWKWebViewVc") new];
    }else if(indexPath.row == 3){
        nextVc = [NSClassFromString(@"TYScrollViewVc") new];
    }else if(indexPath.row == 4){
        nextVc = [NSClassFromString(@"TYCollectionViewVc") new];
    }else if(indexPath.row == 5){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        nextVc = [storyboard instantiateViewControllerWithIdentifier:@"TYScrollEmbedVC"];
    }
    
    if (nextVc != nil) {
        nextVc.title = self.dataSourceArr[indexPath.row];
        [self.navigationController pushViewController:nextVc animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
