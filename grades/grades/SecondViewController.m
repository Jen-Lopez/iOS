//
//  SecondViewController.m
//  grades
//
//  Created by Jennifer Lopez on 2/26/20.
//  Copyright © 2020 JenLopez. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UITextField *studentField;
@property (weak, nonatomic) IBOutlet UITextField *studAddress;
@end

@implementation SecondViewController

- (IBAction)goBack:(UIBarButtonItem *)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.studentField.text = self.sName;
    self.studAddress.text = self.studentAddress;
    
    _studentField.userInteractionEnabled = NO;
    _studAddress.userInteractionEnabled = NO;
   
    // unavailable Image
    UIImage *image = [UIImage imageNamed:@"noimage.png"];
    [_studentImage setImage:image];
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
