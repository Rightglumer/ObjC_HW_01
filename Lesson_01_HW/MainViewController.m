//
//  ViewController.m
//  Lesson_01_HW
//
//  Created by Glumer Glumer on 14.01.2021.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UISegmentedControl *segChooseController;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong) SecondViewController *secondViewController;
@property (nonatomic, strong) UIButton *buttonShowController;
@property (nonatomic, strong) UISlider *sliderButtonFont;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    double currentTop;
    double centerOfScreen;
    double STEP_BETWEEN_COMPONENTS = 24.0;
    double COMPONENT_HEIGHT = 50.0;
    
    currentTop = 100;
    UILabel *labelSelectController = [[UILabel alloc] init];
    double widthOfScreen = [UIScreen mainScreen].bounds.size.width;
    labelSelectController.text = @"Choose controller color";
    labelSelectController.frame = CGRectMake(0, currentTop, widthOfScreen, COMPONENT_HEIGHT);
    labelSelectController.tintColor = [UIColor whiteColor];
    labelSelectController.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelSelectController];
    
    currentTop = currentTop + labelSelectController.bounds.size.height + STEP_BETWEEN_COMPONENTS;
    centerOfScreen = widthOfScreen / 2;
    
    self.segChooseController = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green"]];
    self.segChooseController.frame = CGRectMake(0, currentTop, widthOfScreen, COMPONENT_HEIGHT);
    self.segChooseController.tintColor = [UIColor greenColor];
    self.segChooseController.selectedSegmentIndex = 0;
    [self.view addSubview:self.segChooseController];
    
    currentTop = currentTop + self.segChooseController.bounds.size.height + STEP_BETWEEN_COMPONENTS;
    
    self.buttonShowController = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonShowController setTitle:@"Show controller" forState:UIControlStateNormal];
    self.buttonShowController.backgroundColor = [UIColor lightGrayColor];
    self.buttonShowController.tintColor = [UIColor whiteColor];
    [self.buttonShowController addTarget:self action:@selector(secondControllerClick:) forControlEvents:UIControlEventTouchUpInside];
    double buttonWidth = 120.0;
    self.buttonShowController.frame = CGRectMake(centerOfScreen - buttonWidth / 2, currentTop + STEP_BETWEEN_COMPONENTS, buttonWidth, COMPONENT_HEIGHT);
    self.buttonShowController.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:self.buttonShowController];
    
    currentTop = currentTop + self.buttonShowController.bounds.size.height + STEP_BETWEEN_COMPONENTS;
    
    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    double activityWidth = 50.0;
    self.activityView.frame = CGRectMake(centerOfScreen - activityWidth / 2, currentTop + STEP_BETWEEN_COMPONENTS, activityWidth, COMPONENT_HEIGHT);
    self.activityView.color = [UIColor redColor];
    self.activityView.hidesWhenStopped = YES;
    [self.view addSubview:self.activityView];
    
    currentTop = currentTop + self.activityView.bounds.size.height + STEP_BETWEEN_COMPONENTS;
    
    self.sliderButtonFont = [[UISlider alloc] init];
    double sliderWidth = 300.0;
    self.sliderButtonFont.frame = CGRectMake(centerOfScreen - sliderWidth / 2, currentTop + STEP_BETWEEN_COMPONENTS, sliderWidth, COMPONENT_HEIGHT);
    self.sliderButtonFont.tintColor = [UIColor magentaColor];
    self.sliderButtonFont.value = 10;
    self.sliderButtonFont.maximumValue = 15;
    self.sliderButtonFont.minimumValue = 10.0;
    [self.sliderButtonFont addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.sliderButtonFont];
    
    currentTop = currentTop + self.sliderButtonFont.bounds.size.height + STEP_BETWEEN_COMPONENTS;
    
    UIImageView *myImage = [[UIImageView alloc] initWithFrame:CGRectMake(centerOfScreen - 75, currentTop, 150, self.view.frame.size.height - currentTop)];
    myImage.image = [UIImage imageNamed:@"kotik"];
    myImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:myImage];
}

- (void)sliderValueChanged:(UISlider *)sender {
    self.buttonShowController.titleLabel.font = [UIFont systemFontOfSize:self.sliderButtonFont.value];
}

- (void) secondControllerClick:(UIButton *)sender
{
    [self showSecondController];
}

- (void)showSecondController
{
    self.secondViewController = [[SecondViewController alloc] init];
    if (self.segChooseController.selectedSegmentIndex == 0) {
        self.secondViewController.view.backgroundColor = [UIColor redColor];
    }
    else {
        self.secondViewController.view.backgroundColor = [UIColor greenColor];
    }
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0f  target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    [self.activityView startAnimating];
    
}

- (void)updateTimer:(NSTimer *)timer {
    [timer invalidate];
    [self.activityView stopAnimating];
    [self.navigationController showViewController:self.secondViewController sender:self];
}


@end
