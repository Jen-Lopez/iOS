//
//  ViewController.m
//  grades
//
//  Created by Jennifer Lopez on 2/25/20.
//  Copyright © 2020 JenLopez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

    @property (weak, nonatomic) IBOutlet UIButton *leftArrow;
    @property (weak, nonatomic) IBOutlet UIButton *rightArrow;
    @property (weak, nonatomic) IBOutlet UIButton *addStudentButton;

    // update info/new student properties
    @property (weak, nonatomic) IBOutlet UITextField *studentName;
    @property (weak, nonatomic) IBOutlet UITextField *address;
    @property (weak, nonatomic) IBOutlet UITextField *midterm;
    @property (weak, nonatomic) IBOutlet UITextField *final;
    @property (weak, nonatomic) IBOutlet UITextField *hw1;
    @property (weak, nonatomic) IBOutlet UITextField *hw2;
    @property (weak, nonatomic) IBOutlet UITextField *hw3;
    @property (strong,nonatomic) NSMutableArray *students;

    @property (nonatomic, assign) NSInteger index;
    @property (weak, nonatomic) IBOutlet UISlider *recordSlider;



@end

@implementation ViewController
@synthesize students, index;

- (IBAction)leftArrow:(UIButton *)sender {
    [self update];
    if (index == 0) {
        _leftArrow.enabled = NO;
    }
    else {
        _leftArrow.enabled = YES;
        _rightArrow.enabled = YES;
        index--;
    }
    _recordSlider.value = index;
    [self displayStudent];
}

- (IBAction)rightArrow:(UIButton *)sender {
    [self update];
    if (index >= [students count]-1) {
        _rightArrow.enabled = NO;
    }
    else {
        _leftArrow.enabled = YES;
        _rightArrow.enabled = YES;
        index++;
    }
    _recordSlider.value = index;
    [self displayStudent];
}

// show student info
-(void)displayStudent {
    _studentName.text = [[students objectAtIndex:index] objectAtIndex:0];
    _address.text = [[students objectAtIndex:index] objectAtIndex:1];
    _midterm.text = [[students objectAtIndex:index] objectAtIndex:2];
    _midterm.text = [[students objectAtIndex:index] objectAtIndex:2];
    _final.text = [[students objectAtIndex:index] objectAtIndex:3];
    _hw1.text = [[students objectAtIndex:index] objectAtIndex:4];
    _hw2.text = [[students objectAtIndex:index] objectAtIndex:5];
    _hw3.text = [[students objectAtIndex:index] objectAtIndex:6];
}

// update any changes done to student info
-(void)update {
    NSMutableArray *current = [students objectAtIndex:index];
    [current replaceObjectAtIndex:0 withObject:_studentName.text];
    [current replaceObjectAtIndex:1 withObject:_address.text];
    [current replaceObjectAtIndex:2 withObject:_midterm.text];
    [current replaceObjectAtIndex:3 withObject:_final.text];
    [current replaceObjectAtIndex:4 withObject:_hw1.text];
    [current replaceObjectAtIndex:5 withObject:_hw2.text];
    [current replaceObjectAtIndex:6 withObject:_hw3.text];
}

- (IBAction)MySegControl:(UISegmentedControl *)sender {

    NSInteger seg = sender.selectedSegmentIndex;

    // update info
    if (seg == 0) {
        self.view.backgroundColor = [UIColor whiteColor];
        _leftArrow.hidden = NO;
        _rightArrow.hidden = NO;
        _addStudentButton.hidden = YES;
        
        // hide slider
        _recordSlider.hidden = NO;

        [_addStudentButton setTitle:@"Add New Student" forState:UIControlStateNormal];

        [self displayStudent];
    }
    
    // display info
    else if (seg == 1){
        [self update];
        [self performSegueWithIdentifier:@"displayInfo" sender:self];
        [_addStudentButton setTitle:@"Add New Student" forState:UIControlStateNormal];
    }
    // new student
    else {
        _leftArrow.hidden = YES;
        _rightArrow.hidden = YES;
        _addStudentButton.hidden = NO;

        self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:244/255.0 blue:255/255.0 alpha:1.0];
        _addStudentButton.backgroundColor = [UIColor colorWithRed:227/255.0 green:223/255.0 blue:239/255.0 alpha:1.0];
        
        // blank record
        [self resetFields];
        
        // hide slider
        _recordSlider.hidden = YES;
    }

}

- (IBAction)clickAddButton:(UIButton *)sender {
    // check if any fields are empty
    if (![_studentName hasText] || ![_address hasText] || ![_midterm hasText] || ![_final hasText] || ![_hw1 hasText] || ![_hw2 hasText] || ![_hw3 hasText] ) {
        
        // do something
        [_addStudentButton setTitle:@"Try Again" forState:UIControlStateNormal];
    }
    else {
        NSMutableArray *newStudent = [NSMutableArray arrayWithObjects: _studentName.text,_address.text,_midterm.text,_final.text,_hw1.text,_hw2.text,_hw3.text,@"blank.png" ,nil];
        [students addObject: newStudent];
        [_addStudentButton setTitle:@"Add New Student" forState:UIControlStateNormal];
        [self resetFields];
        // set slider max
        [_recordSlider setMaximumValue: [students count]-1];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"displayInfo"]) {
        SecondViewController *secondVC = segue.destinationViewController;
        
        // set values in segue
        secondVC.sName = self.studentName.text;
        secondVC.studentAddress = self.address.text;
    }
}

- (void) resetFields {
    _studentName.text = @"";
    _address.text = @"";
    _midterm.text = @"";
    _midterm.text = @"";
    _final.text = @"";
    _hw1.text = @"";
    _hw2.text = @"";
    _hw3.text = @"";
}
// hide cursor
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [[event allTouches] anyObject];

    if (![[touch view] isKindOfClass:[UITextField class]]) {
        [self.view endEditing:YES];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)changeSlider:(UISlider *)sender {
    [self update];
    index = _recordSlider.value;
    [self displayStudent];
    if (index >= [students count]-1) {
        _rightArrow.enabled = NO;
    }
    else {_rightArrow.enabled = YES;}
    if (index <= 0) {
        _leftArrow.enabled = NO;
    }
    else {_leftArrow.enabled = YES;}
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _addStudentButton.hidden = YES;
    
    // allocate memory to array
    students = [NSMutableArray array];
    
    // add default students
    NSMutableArray *stud;
    stud = [NSMutableArray arrayWithObjects: @"King Richard III", @"Leicester Castle, England",@"72",@"45",@"9",@"10",@"0",@"richard.png",nil];
    
    [students addObject:stud];
    
    stud = [NSMutableArray arrayWithObjects: @"Prince Hamlet", @"Elsinore Castle, Denmark",@"100",@"0",@"10",@"10",@"10",@"younghamlet.png",nil];
    
    [students addObject:stud];
    
    stud = [NSMutableArray arrayWithObjects: @"King Lear", @"Leicester Castle, England",@"100",@"22",@"10",@"6",@"0",@"lear.png",nil];
    
    [students addObject:stud];
    
    stud = [NSMutableArray arrayWithObjects: @"King Henry VIII", @"Whitehall Palace, England",@"62",@"60",@"7",@"6",@"7",@"henry8.png",nil];
    
    [students addObject:stud];
    
    stud = [NSMutableArray arrayWithObjects: @"Queen Elizabeth", @"Richmond Palace, England",@"90",@"100",@"9",@"10",@"10",@"elizabeth.png",nil];
    
    [students addObject:stud];
    
    // init
    index = 0;
    
    [self displayStudent];
    
    if (index == 0) {
        _leftArrow.enabled = NO;
    }
    
    // set slider max
    [_recordSlider setMaximumValue: [students count]-1];
}

@end
