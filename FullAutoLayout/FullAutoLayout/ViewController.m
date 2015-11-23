//
//  ViewController.m
//  FullAutoLayout
//
//  Created by 周吾昆 on 15/11/23.
//  Copyright © 2015年 zhang_rongwu. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) UIView *view1;
@property(nonatomic, strong) UIView *view2;
@property(nonatomic, strong) UIView *view3;

@property(nonatomic, strong) UIView *view11;
@property(nonatomic, strong) UIView *view12;
@property(nonatomic, strong) UIView *view21;
@property(nonatomic, strong) UIView *view22;
@property(nonatomic, strong) UIView *view31;
@property(nonatomic, strong) UIView *view32;

@property(nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setFrame];
    [self.label sizeToFit];
    self.label.numberOfLines = 0;
    self.label.text = @"牛逼的自动布局牛逼的自动布局牛逼的自动布局牛逼的自动布局牛逼的自动布局牛逼的自动布局牛逼的自动布局";
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CGFloat y = CGRectGetMaxY(self.view3.frame);
    self.scrollView.contentSize = CGSizeMake(0, y);
    
    if(self.label.frame.size.width >= 300){
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(300);
            make.top.equalTo(self.view12.mas_top).offset(20);
            make.left.equalTo(self.view12.mas_left).offset(20);
        }];
    }
}

- (void)setFrame{
    CGFloat H = 120;
    [self.view11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view1.mas_top).offset(10);
        make.height.mas_equalTo(H);
    }];
    [self.view12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view11.mas_bottom).offset(10);
        make.height.mas_equalTo(H);
    }];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.scrollView.mas_top);
        make.bottom.equalTo(self.view12.mas_bottom).offset(10);
    }];
    
    
    [self.view21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view2.mas_top).offset(10);
        make.height.mas_equalTo(H);
    }];
    [self.view22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view21.mas_bottom).offset(10);
        make.height.mas_equalTo(H);
    }];
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view1.mas_bottom).offset(10);
        make.bottom.equalTo(self.view22.mas_bottom).offset(10);
    }];
    
    
    [self.view31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view3.mas_top).offset(10);
        make.height.mas_equalTo(H);
    }];
    [self.view32 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view31.mas_bottom).offset(10);
        make.height.mas_equalTo(H);
    }];
    [self.view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view2.mas_bottom).offset(10);
        make.bottom.equalTo(self.view32.mas_bottom).offset(10);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view12.mas_top).offset(20);
        make.left.equalTo(self.view12.mas_left).offset(20);
    }];
}

- (void)setUI{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.scrollView];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.delegate = self;
    
    self.view1 = [[UIView alloc]init];
    [self.scrollView addSubview:self.view1];
    self.view1.backgroundColor = [UIColor purpleColor];
    self.view11 = [[UIView alloc]init];
    [self.view1 addSubview:self.view11];
    self.view11.backgroundColor = [UIColor lightGrayColor];
    self.view12 = [[UIView alloc]init];
    [self.view1 addSubview:self.view12];
    self.view12.backgroundColor = [UIColor grayColor];
    
    self.label = [[UILabel alloc]init];
    [self.view12 addSubview:self.label];
    
    self.view2 = [[UIView alloc]init];
    [self.scrollView addSubview: self.view2];
    self.view2.backgroundColor = [UIColor purpleColor];
    self.view21 = [[UIView alloc]init];
    [self.view2 addSubview:self.view21];
    self.view21.backgroundColor = [UIColor lightGrayColor];
    self.view22 = [[UIView alloc]init];
    [self.view2 addSubview:self.view22];
    self.view22.backgroundColor = [UIColor grayColor];
    
    self.view3 = [[UIView alloc]init];
    [self.scrollView addSubview: self.view3];
    self.view3.backgroundColor = [UIColor purpleColor];
    self.view31 = [[UIView alloc]init];
    [self.view3 addSubview:self.view31];
    self.view31.backgroundColor = [UIColor lightGrayColor];
    self.view32 = [[UIView alloc]init];
    [self.view3 addSubview:self.view32];
    self.view32.backgroundColor = [UIColor grayColor];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"浪起来");
}
@end
