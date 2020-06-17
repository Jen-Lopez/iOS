//
//  FourthViewController.h
//  games
//
//  Created by Jennifer Lopez on 3/14/20.
//  Copyright © 2020 JenLopez. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol scoreKeeperDelegate <NSObject>
- (void) changeScore : (int)newScore;
@end

@interface FourthViewController : UIViewController{
    UIImageView *ball, *paddle;
    NSTimer *timer;
    CGPoint directionBall,directionPaddle;
}
@property int newScore;
@property (nonatomic, weak) id <scoreKeeperDelegate> scoreDelegate;

- (void) handleTimer: (NSTimer *) timer;
@end

NS_ASSUME_NONNULL_END
