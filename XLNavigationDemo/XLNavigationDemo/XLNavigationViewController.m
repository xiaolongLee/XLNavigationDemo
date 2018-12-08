//
//  XLNavigationViewController.m
//  XLNavigationDemo
//
//  Created by 李小龙 on 2018/12/8.
//  Copyright © 2018 李小龙. All rights reserved.
//

#import "XLNavigationViewController.h"
#import "ViewController.h"
#import "TargetViewController.h"
@interface XLNavigationViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation XLNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    
    id target = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark -- UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isHideNav = ([viewController isKindOfClass:[viewController class]] || [viewController isKindOfClass:[TargetViewController class]]);
    NSLog(@"isHide = %d", isHideNav);
    [self setNavigationBarHidden:isHideNav animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
