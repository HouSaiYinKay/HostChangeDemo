//
//  CustomSelectorViewController.h
//  DomainSwitchDemo
//
//  Created by 推凯 on 2020/6/26.
//  Copyright © 2020 asf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^saveBlc)(void);
@interface CustomSelectorViewController : UIViewController
@property(copy,nonatomic)saveBlc blc;
@end

NS_ASSUME_NONNULL_END
