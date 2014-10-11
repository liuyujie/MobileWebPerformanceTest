//
//  exResultViewController.m
//  test2
//
//  Created by fanyu on 14-8-31.
//  Copyright (c) 2014年 fanyu. All rights reserved.
//

#import "exResultViewController.h"

@interface exResultViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property CGFloat btmHeight;
@property UIView* btmBar;
@end

@implementation exResultViewController

@synthesize resultImages;
@synthesize scrollView;
@synthesize topScrollView;
@synthesize btmHeight;
@synthesize btmBar;


-(id) initWithResultImages: (NSMutableArray*) images{
    self = [super init];
    if(self){
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int count = resultImages.count;
    // Do any additional setup after loading the view.
    CGFloat viewWidth = 320;
    CGFloat viewHeight = 245;
    CGFloat singleViewWidth = 152;
    CGFloat imageViewHeight = 210;
    CGFloat imageContentTop = 25;
    CGFloat txMgLeft = 5;
    btmHeight = 30;
    
    //UIBarButtonItem* backBtn = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem.title = @"Back";
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.bounds.size.height, viewWidth, viewHeight)];
    
    scrollView.delegate = self;
    [scrollView setBackgroundColor:[UIColor lightGrayColor]];
    
    self.scrollView.contentSize = CGSizeMake(singleViewWidth*count, viewHeight);
    
//    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    
    CGFloat left = 0;
    for (NSUInteger i = 0; i <count; i++) {
        NSDictionary* obj = [resultImages objectAtIndex:i];
        UIImage* image = [obj objectForKey: @"image"];
        CGFloat scale = image.size.height / imageViewHeight;
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(left, 0, singleViewWidth, viewHeight)];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(txMgLeft, imageContentTop, image.size.width/scale, imageViewHeight)];
        [imageView setImage:image];
        [view addSubview:imageView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(txMgLeft, 0, 100, imageContentTop)];
        [view addSubview:label];
        label.text = [obj objectForKey: @"label"];
        [scrollView addSubview:view];
        left += (singleViewWidth);
    }
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"Back" forState:UIControlStateNormal];    
    
    
    topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [topScrollView setContentSize:CGSizeMake(320, viewHeight+self.titleLabel.frame.size.height)];
    [topScrollView addSubview:scrollView];
    [self.view addSubview:topScrollView];
    
    
    _onloadTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(txMgLeft, viewHeight+self.navigationController.navigationBar.bounds.size.height+50,  200, 36)];
    _onloadTimeLabel.text = [NSString stringWithFormat:@"Onload Time: %@ms", _onloadTime];
    [self.view addSubview:_onloadTimeLabel];
}

- (void) back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) viewWillAppear:(BOOL)animated{
    
}


-(void) viewDidAppear:(BOOL)animated{
    [topScrollView setFrame:CGRectMake(0, 50, 320, self.view.window.bounds.size.height-50)];
//    btmBar = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.window.bounds.size.height-btmHeight, self.view.window.bounds.size.width, btmHeight)];
//    
//    
//    btmBar.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:btmBar];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
