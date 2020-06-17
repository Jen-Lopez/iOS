//
//  ThirdViewController.m
//  games
//
//  Created by Jennifer Lopez on 3/13/20.
//  Copyright © 2020 JenLopez. All rights reserved.
//

#import "ThirdViewController.h"
#import "DrawView.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UIButton *drawButton;
@property (weak, nonatomic) IBOutlet DrawView *draw;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)drawShape:(UIButton *)sender {
    self.draw.drawImg = YES;
    [self.draw setNeedsDisplay];
}

@end
