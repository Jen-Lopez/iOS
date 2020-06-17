//
//  SecondViewController.m
//  games
//
//  Created by Jennifer Lopez on 3/13/20.
//  Copyright © 2020 JenLopez. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"me.JPG"];
    [self.imageView setImage:image];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height /2;
    self.imageView.layer.borderWidth = 5.0f;

    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.clipsToBounds = YES;
}

@end
