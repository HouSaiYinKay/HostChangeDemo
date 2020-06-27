//
//  ViewController.m
//  DomainSwitchDemo
//
//  Created by 推凯 on 2020/6/26.
//  Copyright © 2020 asf. All rights reserved.
//

#import "ViewController.h"
#import "LocalSelectorViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LocalSelectorViewController*loocal=[[LocalSelectorViewController alloc]init];
    [self.navigationController pushViewController:loocal animated:YES];
}


@end
