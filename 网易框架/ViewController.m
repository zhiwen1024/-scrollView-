//
//  ViewController.m
//  网易框架
//
//  Created by mac on 15-3-11.
//  Copyright (c) 2015年 zw. All rights reserved.
//

#import "ViewController.h"
#import "TXContentController.h"
#import "TXLable.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *titleScroll;
@property (weak, nonatomic) IBOutlet UIScrollView *contantScroll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    [self addChildControllers];
    //添加标签
    [self addLables];
    //设置内置的内容contantScroll属性
    _contantScroll.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width *self.childViewControllers.count, 0 );
    _contantScroll.pagingEnabled = YES;
    //设置默认控制器
    UIViewController *vc = self.childViewControllers.firstObject;
    vc.view.frame = self.contantScroll.bounds;
    [self.contantScroll addSubview:vc.view];
    
}

- (void)addLables{
    NSInteger count = self.childViewControllers.count;
    for (int i = 0; i < count; ++i) {
        UIViewController *vc = self.childViewControllers[i];
        //新建label
        TXLable *label = [[TXLable alloc]init];
        label.tag = i ;
        label.text = vc.title;
        CGFloat labelW = 80;
        CGFloat labelH = 30;
        CGFloat labelY = 0;
        CGFloat labelX = i *labelW ;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        [self.titleScroll addSubview:label];
        //设置titleScroll的属性
        _titleScroll.contentSize = CGSizeMake(count * labelW, 0);
        _titleScroll.showsHorizontalScrollIndicator = NO;
        _titleScroll.showsVerticalScrollIndicator = NO;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
        
    }


}

- (void)labelClick:(UITapGestureRecognizer *)label{
    //点击label跳转到相应的控制器
    TXLable *label2 = (TXLable *)label.view;
    NSInteger i = label2.tag;
    //设置x方向的偏移量
    CGFloat x = i * [UIScreen mainScreen].bounds.size.width;
    #warning 注意y的值
    [self.contantScroll setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)addChildControllers{
    TXContentController *vc1 = [[TXContentController alloc]init];
    vc1.title = @"vc1";
    [self addChildViewController:vc1];
    
    TXContentController *vc2 = [[TXContentController alloc]init];
    vc2.title = @"vc2";
    [self addChildViewController:vc2];
    
    
    TXContentController *vc3 = [[TXContentController alloc]init];
    vc3.title = @"vc3";
    [self addChildViewController:vc3];
    
    TXContentController *vc4 = [[TXContentController alloc]init];
    vc4.title = @"vc4";
    [self addChildViewController:vc4];
    
    TXContentController *vc5 = [[TXContentController alloc]init];
    vc5.title = @"vc5";
    [self addChildViewController:vc5];
    
    TXContentController *vc6 = [[TXContentController alloc]init];
    vc6.title = @"vc6";
    [self addChildViewController:vc6];

}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x /scrollView.bounds.size.width;
    //最大偏移量
    TXLable *label = self.titleScroll.subviews[index];
    CGFloat titleW = self.titleScroll.bounds.size.width;
    CGFloat offx = label.center.x - titleW *0.5;
    CGFloat maxOffx = self.titleScroll.contentSize.width - titleW;
    if (offx<0) {
        offx = 0;
    }else{
        offx = maxOffx;
    }
    [self.titleScroll setContentOffset:CGPointMake(offx, self.titleScroll.contentOffset.y) animated:YES];
    
    UIViewController *vc = self.childViewControllers[index];
    CGFloat vcX = index * self.contantScroll.bounds.size.width;
    CGFloat vcY = 0;
    CGFloat vcw =self.contantScroll.bounds.size.width;
    CGFloat vcH = self.contantScroll.bounds.size.height;
    vc.view.frame = CGRectMake(vcX, vcY, vcw, vcH);
    [self.contantScroll addSubview:vc.view];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];

}




















//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
//{
//    // 获得当前需要显示的子控制器的索引
//    NSUInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
//    
//    // 滚动标题栏（self.titlesScrollView）
//    TXLable *label = self.titleScroll.subviews[index];
//    CGFloat titlesW = self.titleScroll.frame.size.width;
//    CGFloat offsetX = label.center.x - titlesW * 0.5;
//    // 最大的偏移量
//    CGFloat maxOffsetX = self.titleScroll.contentSize.width - titlesW;
//    if (offsetX < 0) {
//        offsetX = 0;
//    } else if (offsetX > maxOffsetX) {
//        offsetX = maxOffsetX;
//    }
//    CGPoint offset = CGPointMake(offsetX, self.titleScroll.contentOffset.y);
//    [self.titleScroll setContentOffset:offset animated:YES];
//    
//    UIViewController *vc = self.childViewControllers[index];
//    // 如果子控制器的view已经在上面，就直接返回
//    if (vc.view.superview) return;
//    
//    // 添加
//    CGFloat vcW = scrollView.frame.size.width;
//    CGFloat vcH = scrollView.frame.size.height;
//    CGFloat vcX = index * vcW;
//    CGFloat vcY = 0;
//    vc.view.frame = CGRectMake(vcX, vcY, vcW, vcH);
//    
//    [scrollView addSubview:vc.view];
//}
//
///**
// *  当scrollView停止滚动时调用这个方法（用户手动触发的动画停止，会调用这个方法）
// */
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    [self scrollViewDidEndScrollingAnimation:scrollView];
//}



@end
