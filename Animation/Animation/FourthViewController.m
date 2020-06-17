//
//  FourthViewController.m
//  games
//
//  Created by Jennifer Lopez on 3/14/20.
//  Copyright © 2020 JenLopez. All rights reserved.
//

#import "FourthViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface FourthViewController ()
@property (strong, nonatomic) IBOutlet UIView *gameView;
@property (weak, nonatomic) IBOutlet UIButton *leftArrow;
@property (weak, nonatomic) IBOutlet UIButton *rightArrow;
@property (weak, nonatomic) IBOutlet UILabel *score;
@end

@implementation FourthViewController

- (void)loadView {
    [ super loadView ];
}

- (void) setup {
    // PADDLE
    UIImage *padImg = [UIImage imageNamed:@"paddle.png"];
    paddle = [[UIImageView alloc]initWithImage:padImg];
    directionPaddle = CGPointMake(-1.0, -1.0);
    paddle.layer.position = CGPointMake(210, 500);

    // BALL
    UIImage *ballImg = [UIImage imageNamed:@"ball.png"];
    ball = [[UIImageView alloc]initWithImage:ballImg];
    directionBall = CGPointMake(1.0, 1.0);
    ball.layer.position = CGPointMake(210, 100);

    [self.gameView.layer addSublayer: paddle.layer];
    [self.gameView.layer addSublayer: ball.layer];
}

- (void) ballSpin {
    CABasicAnimation *rotateAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];

    rotateAnim.fromValue = [NSNumber numberWithFloat:0.0f];
    rotateAnim.toValue = [NSNumber numberWithFloat: 2*M_PI];
    rotateAnim.duration = 5;
    rotateAnim.repeatCount = 1000;
    [ball.layer addAnimation: rotateAnim forKey: @"spin"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    timer = [ NSTimer scheduledTimerWithTimeInterval: 0.01
                                     target: self
                                   selector: @selector(handleTimer:)
                                   userInfo: nil
                                    repeats: YES
    ];
    [self ballSpin];
    [self.score setText: [NSString stringWithFormat:@"%d",_newScore]];
}

- (IBAction)leftDown:(UIButton *)sender {
            CGPoint origin = paddle.layer.position;
            CGSize size = [paddle image].size;
            if (paddle.layer.position.x <= ( (size.width / 2) + 1) - self.gameView.frame.origin.x){
                origin.x += 10; // bounce
            }
            else {
                origin.x -= 10;
            }
            paddle.layer.position = origin;
}
- (IBAction)rightDown:(UIButton *)sender {
        CGPoint origin = paddle.layer.position;
        CGSize size = [paddle image].size;
        if (paddle.layer.position.x + (size.width / 2) + 1 >=
        (self.gameView.frame.size.width - self.gameView.frame.origin.x) - 1){
            origin.x -= 10; // bounce
        }
        else {
            origin.x += 10;
        }
        paddle.layer.position = origin;
}

- (void) handleTimer: (NSTimer *) timer {
    CGSize size;
    CGPoint origin;

    // Move the image1
    size = [ball image].size;
    if (ball.layer.position.x <=
       ( (size.width / 2) + 1) - self.gameView.frame.origin.x)
       directionBall.x = 1.0;
    if (ball.layer.position.x + (size.width / 2) + 1 >=
       (self.gameView.frame.size.width - self.gameView.frame.origin.x) - 1)
       directionBall.x = -1.0;
    if (ball.layer.position.y <= 35) // top
       directionBall.y = 1.0;
    origin = ball.layer.position;
    origin.x += directionBall.x;
    origin.y += directionBall.y;
    if (ball.layer.position.y + (size.height / 2) >= 600){  // bottom
       // make ball dissapear
        ball.alpha = 0.0;
        // relaunch
        origin.x = 210;
        origin.y = 100;
    }

    ball.layer.position = origin;
    ball.alpha = 1.0;
    // Collision
    if (CGRectIntersectsRect(ball.layer.frame, paddle.layer.frame)){
        directionBall.x = -1.0;
        directionBall.y = -1.0;

        origin = ball.layer.position;
        origin.x += directionBall.x;
        origin.y += directionBall.y;
        ball.layer.position = origin;
        
        // change score
        self.newScore = [self.score.text intValue] + 1;
        self.score.text = [NSString stringWithFormat:@"%d",self.newScore];
        [self.scoreDelegate changeScore: self.newScore];
    }
}

- (IBAction)goBack:(UIBarButtonItem *)sender {
    [timer invalidate];
    timer = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
