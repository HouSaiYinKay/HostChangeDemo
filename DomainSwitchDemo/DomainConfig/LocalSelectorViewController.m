//
//  DomainConfigLocalSelectorViewController.m
//  DomainSwitchDemo
//
//  Created by 推凯 on 2020/6/26.
//  Copyright © 2020 asf. All rights reserved.
//

#import "LocalSelectorViewController.h"
#import "DomainConfigManager.h"
#import "DomainConfigConst.h"
#import "CustomSelectorViewController.h"
@interface LocalSelectorViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView*talbeView;
@property(strong,nonatomic) NSMutableArray*serversArray;
@end

@implementation LocalSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _serversArray=[DomainConfigManager share].allServers;
    [self refreshUI];
}
-(void)refreshUI{
    [self.view addSubview:self.talbeView];
    [_talbeView reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary*dict=_serversArray[indexPath.row];
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cellid"];
    cell.textLabel.text=dict[kserveName];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[DomainConfigManager share] changeEvnTo:indexPath.row];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _serversArray.count;
}
-(void)pushCustomController{
    CustomSelectorViewController*customSelct=[[CustomSelectorViewController alloc]initWithNibName:@"CustomSelectorViewController" bundle:nil];
    [self.navigationController pushViewController:customSelct animated:YES];
}
-(UITableView *)talbeView{
    if (!_talbeView) {
        _talbeView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _talbeView.delegate=self;
        _talbeView.dataSource=self;
        _talbeView.estimatedRowHeight=50;
        [_talbeView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
        
        //heaerView
        UILabel*currentEnv=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        currentEnv.font=[UIFont systemFontOfSize:16];
        currentEnv.text=[NSString stringWithFormat:@"当前环境为%@",[[DomainConfigManager share]getCurrentEvnDict][kserveName]];
        _talbeView.tableHeaderView=currentEnv;
        
        //footerView
        UIView*view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        view.backgroundColor=[UIColor yellowColor];
        UIButton*customBt=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        [customBt addTarget:self action:@selector(pushCustomController) forControlEvents:UIControlEventTouchUpInside];
        [customBt setTitle:@"自定义" forState:UIControlStateNormal];
        [view addSubview:customBt];

        _talbeView.tableFooterView=view;
    }
    return _talbeView;
}
@end
