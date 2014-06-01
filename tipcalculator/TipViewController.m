//
//  TipViewController.m
//  tipcalculator
//
//  Created by Tom Gurka on 5/28/14.
//  Copyright (c) 2014 tom. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UITextField *setFont;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipTextField;
@property (weak, nonatomic) IBOutlet UILabel *splitLabel;
@property (weak, nonatomic) IBOutlet UITextField *splitTextField;


- (IBAction)onTap:(id)sender;
-(void)updateValues;


@end


@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"T I P   C A L C U L A T O R";
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    float splitNumber = [self.splitTextField.text floatValue];
    
    NSString *percent = self.tipTextField.text;
    float pValue = [percent floatValue] /100;
    
    float tipAmount = billAmount * pValue;
    float totalAmount = tipAmount + billAmount;
    float splitAmount = tipAmount + billAmount / splitNumber;
   
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    self.splitLabel.text = [NSString stringWithFormat:@"$%0.2f", splitAmount];

}





@end
