//
//  ViewController.m
//  XLNavigationDemo
//
//  Created by 李小龙 on 2018/12/8.
//  Copyright © 2018 李小龙. All rights reserved.
//

#import "ViewController.h"
#import "TargetViewController.h"
#import "FirstViewController.h"
@interface ViewController () <UINavigationControllerDelegate>
@property (nonatomic,strong) UIButton *btn1;
@property (nonatomic,strong) UIButton *btn2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createUI];
}

- (void)createUI{
    self.btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn1.frame = CGRectMake(100, 100, 100, 100);
    [self.btn1 setTitle:@"没有导航" forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.btn1];
    [self.btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn2.frame = CGRectMake(100, 300, 100, 100);
    [self.btn2 setTitle:@"有导航" forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.btn2];
    [self.btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btn1Click{
    UIViewController  *targetVC = [TargetViewController new];
    targetVC.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:targetVC animated:YES];
}


- (void)btn2Click{
    [self.navigationController pushViewController:[FirstViewController new] animated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    BOOL isHomePage = [viewController  isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isHomePage animated:YES];
}


@end
