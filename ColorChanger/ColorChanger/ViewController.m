//
//  ViewController.m
//  ColorChanger
//
//  Created by Jennifer Lopez on 2/16/20.
//  Copyright © 2020 JenLopez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *heading;
@property (weak, nonatomic) IBOutlet UILabel *colorOutput;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;

@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;

@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;

@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;
@property (weak, nonatomic) IBOutlet UILabel *alphaLabel;

@property (weak, nonatomic) IBOutlet UILabel *redHexLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenHexLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueHexLabel;
@property (weak, nonatomic) IBOutlet UILabel *alphaHexLabel;

@property (nonatomic) float red;
@property (nonatomic) float green;
@property (nonatomic) float blue;
@property (nonatomic) float alpha;

@property (nonatomic) NSString* colorValue;

@end

@implementation ViewController

- (IBAction)redSlider:(UISlider *)sender {
    _red = (float)_redSlider.value;
    NSString *displayNum = [[NSString alloc] initWithFormat:@"%d", (int)_red];
    NSString *hex = [NSString stringWithFormat:@"%02lX",
    (unsigned long)[displayNum integerValue]];
    
    _redLabel.text = displayNum;
    _redHexLabel.text = hex;
    _colorOutput.backgroundColor = [UIColor colorWithRed:_red/255.0 green:_green/255.0 blue:_blue/255.0 alpha:_alpha/255.0];
    _colorValue = [NSString stringWithFormat:@"#%@%@%@", _redHexLabel.text, _greenHexLabel.text, _blueHexLabel.text];
    _colorOutput.text = _colorValue;
}

- (IBAction)greenSlider:(UISlider *)sender {
    _green = (float) _greenSlider.value;
    NSString *displayNum = [[NSString alloc] initWithFormat:@"%d", (int)_green];
    NSString *hex = [NSString stringWithFormat:@"%02lX",
    (unsigned long)[displayNum integerValue]];
    
    _greenLabel.text = displayNum;
    _greenHexLabel.text = hex;
    _colorOutput.backgroundColor = [UIColor colorWithRed:_red/255.0 green:_green/255.0 blue:_blue/255.0 alpha:_alpha/255.0];
    _colorValue = [NSString stringWithFormat:@"#%@%@%@", _redHexLabel.text, _greenHexLabel.text, _blueHexLabel.text];
    _colorOutput.text = _colorValue;
}

- (IBAction)blueSlider:(UISlider *)sender {
    _blue = (float)_blueSlider.value;
    NSString *displayNum = [[NSString alloc] initWithFormat:@"%d", (int)_blue];
    NSString *hex = [NSString stringWithFormat:@"%02lX",
    (unsigned long)[displayNum integerValue]];
    
    _blueHexLabel.text = hex;
    _blueLabel.text = displayNum;
    _colorOutput.backgroundColor = [UIColor colorWithRed:_red/255.0 green:_green/255.0 blue:_blue/255.0 alpha:_alpha/255.0];
    _colorValue = [NSString stringWithFormat:@"#%@%@%@", _redHexLabel.text, _greenHexLabel.text, _blueHexLabel.text];
    _colorOutput.text = _colorValue;
}

- (IBAction)alphaSlider:(UISlider *)sender {
    _alpha = (float) _alphaSlider.value;
    NSString *displayNum = [[NSString alloc] initWithFormat:@"%d", (int) _alpha];
    NSString *hex = [NSString stringWithFormat:@"%02lX",
     (unsigned long)[displayNum integerValue]];
    
    _alphaHexLabel.text = hex;
    _alphaLabel.text = displayNum;
    
    _colorOutput.backgroundColor = [UIColor colorWithRed:_red/255.0 green:_green/255.0 blue:_blue/255.0 alpha:_alpha/255.0];

    
    // changes opacity of text
    [_colorOutput setAlpha: _alpha/255];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // change border radius of title
    _heading.layer.masksToBounds = true;
    _heading.layer.cornerRadius = 10;

    //  sliders should be set randomly
    _red = (float) arc4random_uniform(255);
    NSString *displayRed = [[NSString alloc] initWithFormat:@"%d", (int)_red];
    NSString *hexRed = [NSString stringWithFormat:@"%02lX",
    (unsigned long)[displayRed integerValue]];
    _redLabel.text = displayRed;
    _redHexLabel.text = hexRed;
    [_redSlider setValue:(int)_red animated:YES];

    _green = (float) arc4random_uniform(255);
    NSString *displayGreen = [[NSString alloc] initWithFormat:@"%d", (int)_green];
    NSString *hexGreen = [NSString stringWithFormat:@"%02lX",
      (unsigned long)[displayGreen integerValue]];
    _greenLabel.text = displayGreen;
    _greenHexLabel.text = hexGreen;
    [_greenSlider setValue:(int)_green animated:YES];

    _blue = (float) arc4random_uniform(255);
    NSString *displayBlue = [[NSString alloc] initWithFormat:@"%d", (int)_blue];
    NSString *hexBlue = [NSString stringWithFormat:@"%02lX",
      (unsigned long)[displayBlue integerValue]];
    _blueLabel.text = displayBlue;
    _blueHexLabel.text = hexBlue;
    [_blueSlider setValue:(int)_blue animated:YES];

    // alpha channel should be set to 255 (opaque)
    [_alphaSlider setValue:255 animated:YES];
    _alphaLabel.text = @"255";
    _alphaHexLabel.text = @"FF";
    _alpha = 255.0;
    
    _colorValue = [NSString stringWithFormat:@"#%@%@%@", _redHexLabel.text, _greenHexLabel.text, _blueHexLabel.text];
    
    // change output
    _colorOutput.backgroundColor = [UIColor colorWithRed:_red/255.0 green:_green/255.0 blue:_blue/255.0 alpha:_alpha/255.0];
    _colorOutput.text = _colorValue;
}

@end
