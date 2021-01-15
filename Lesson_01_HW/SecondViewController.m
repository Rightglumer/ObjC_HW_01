//
//  ButtonViewController.m
//  Lesson_01_HW
//
//  Created by Glumer Glumer on 14.01.2021.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UIProgressView *myProgress;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *textField = [[UITextField alloc] init];
    double centerX = self.view.frame.size.width / 2;
    double centerY = self.view.frame.size.height / 2;
    double textWidth = self.view.frame.size.width / 2;
    double textHeight = 100;
    textField.frame = CGRectMake(centerX - textWidth / 2, centerY - textHeight / 2, textWidth, textHeight);
    textField.text = @"This is second controller";
    [self.view addSubview:textField];
    
    self.myProgress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    self.myProgress.progressTintColor = [UIColor whiteColor];
    self.myProgress.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    self.myProgress.progress = 0.0;
    [self.view addSubview:self.myProgress];
    
    UITextView *myTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, 200, 50)];
    myTextView.backgroundColor = [UIColor lightGrayColor];
    myTextView.textColor = [UIColor greenColor];
    myTextView.text = @"This is text field";
    [self.view addSubview:myTextView];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f  target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
}

- (void)updateTimer:(NSTimer *)timer {
    self.myProgress.progress += 0.1;
    if (self.myProgress.progress == 1) {
        [timer invalidate];
    }
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
