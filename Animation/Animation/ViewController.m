//
//  ViewController.m
//  games
//
//  Created by Jennifer Lopez on 3/13/20.
//  Copyright © 2020 JenLopez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
    @property NSArray *links;
    @property (weak, nonatomic) IBOutlet UITableView *table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.links  = @[@"About", @"Draw!", @"Paddle Game"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.links count];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellID = @"ViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = self.links[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    [cell.textLabel setFont:[UIFont fontWithName:@"Menlo" size:20]];
    cell.textLabel.textColor = [UIColor colorWithRed:252.00/255.00 green:135.00/255.00 blue:148.00/255.00 alpha:1.0];
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor colorWithRed:253.00/255.00 green:241.00/255.00 blue:237.00/255.00 alpha:1.0];
    }
    else if (indexPath.row == 1){
        cell.backgroundColor = [UIColor colorWithRed:241.00/255.00 green:241.00/255.00 blue:255.00/255.00 alpha:1.0];
    }
    else {
        cell.backgroundColor = [UIColor colorWithRed:234.00/255.00 green:247.00/255.00 blue:255.00/255.00 alpha:1.0];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated:YES];
    if ([indexPath row] == 0) {
        [self performSegueWithIdentifier:@"showInfo" sender:self];
    }
    else if ([indexPath row] == 1) {
        [self performSegueWithIdentifier:@"showAnimation" sender:self];
    }
    else {
        // set delegate
        //viewcontroller.delegate = self;
//        NYUSignInViewController *signInVC = segue.destinationViewController;
//        signInVC.delegate = self;
//            NSLog(@"scoreVal = %d" ,scoreVal);
        [self performSegueWithIdentifier:@"showGame" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showGame"]) {
        FourthViewController *fourth = segue.destinationViewController;
        fourth.scoreDelegate = self;
        fourth.newScore = scoreVal;
    }
}

- (void)changeScore:(int)newScore {
    scoreVal = newScore;
}

@end
