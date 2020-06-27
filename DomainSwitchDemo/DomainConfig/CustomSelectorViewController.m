//
//  CustomSelectorViewController.m
//  DomainSwitchDemo
//
//  Created by 推凯 on 2020/6/26.
//  Copyright © 2020 asf. All rights reserved.
//

#import "CustomSelectorViewController.h"
#import "DomainConfigConst.h"
#import "DomainConfigManager.h"
@interface CustomSelectorViewController ()

@end

@implementation CustomSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[DomainConfigManager share] addCustomEvnWithName:@"自定义1" domains:@{@"kserveName":@"value"}];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (_blc) {
        _blc();
    }
}

@end
