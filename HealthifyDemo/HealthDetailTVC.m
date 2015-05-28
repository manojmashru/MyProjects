//
//  HealthDetailTVC.m
//  HealthifyDemo
//
//  Created by Manoj Mashru on 5/27/15.
//  Copyright (c) 2015 Manoj Mashru. All rights reserved.
//

#import "HealthDetailTVC.h"

@interface HealthDetailTVC ()

@property(nonatomic,strong)NSMutableArray *arr;

@end

@implementation HealthDetailTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrViewCalEaten.contentSize = CGSizeMake((self.view.frame.size.width-16)*3, 139);
    
    self.scrViewCalBurnt.contentSize = CGSizeMake((self.view.frame.size.width-16)*2, 139);

    self.containerViewCalEaten.frame = CGRectMake(0, 0, (self.view.frame.size.width-16)*3, 139);
    self.containerViewCalBurnt.frame = CGRectMake(0, 0, (self.view.frame.size.width-16)*2, 139);

    self.arr = [[NSMutableArray alloc] initWithObjects:@"0", @"0",@"0",nil];
    self.tableView.rowHeight = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    UIButton *button = [[UIButton alloc] initWithFrame:sectionView.frame];
    [button addTarget:self action:@selector(btnSectionHeaderClicked:) forControlEvents:UIControlEventTouchUpInside];
    if(section == 0){
        [button setTitle:@"0 of 2000 Cal eaten" forState:UIControlStateNormal];
        sectionView.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:108.0/255.0  blue:68.0/255.0  alpha:1.0];
    }else if (section == 1){
        [button setTitle:@"0 of 400 Cal burnt" forState:UIControlStateNormal];
        sectionView.backgroundColor = [UIColor colorWithRed:35.0/255.0 green:105.0/255.0  blue:153.0/255.0  alpha:1.0];
    }else{
        [button setTitle:@"70 Kgs - Set Goal" forState:UIControlStateNormal];
        sectionView.backgroundColor = [UIColor colorWithRed:83.0/255.0 green:33.0/255.0  blue:168.0/255.0  alpha:1.0];
    }

    button.tag = section;
    [sectionView addSubview:button];

    return sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[self.arr objectAtIndex:indexPath.section] isEqualToString:@"1"] ? 200.0 : 0.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(void)btnSectionHeaderClicked:(id)sender{
    
    [self.tableView beginUpdates];

    if([[self.arr objectAtIndex:[sender tag]] isEqualToString:@"0"])
        [self.arr replaceObjectAtIndex:[sender tag] withObject:@"1"];
    else
        [self.arr replaceObjectAtIndex:[sender tag] withObject:@"0"];

    [self.tableView endUpdates];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    if([scrollView isEqual:self.scrViewCalEaten]){
        self.pageControlCalEaten.currentPage = page;
    }
    else{
        self.pageControlCalBurn.currentPage = page;
    }
}

@end
