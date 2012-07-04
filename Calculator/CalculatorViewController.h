//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Mike Griffiths on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientButton.h"

@interface CalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *description;
@property (weak, nonatomic) IBOutlet UITextField *display;
@property (weak, nonatomic) IBOutlet GradientButton *nineButton;
@property (weak, nonatomic) IBOutlet GradientButton *eightButton;
@property (weak, nonatomic) IBOutlet GradientButton *sevenButton;
@property (weak, nonatomic) IBOutlet GradientButton *sixButton;
@property (weak, nonatomic) IBOutlet GradientButton *fiveButton;
@property (weak, nonatomic) IBOutlet GradientButton *fourButton;
@property (weak, nonatomic) IBOutlet GradientButton *threeButton;
@property (weak, nonatomic) IBOutlet GradientButton *twoButton;
@property (weak, nonatomic) IBOutlet GradientButton *oneButton;
@property (weak, nonatomic) IBOutlet GradientButton *zeroButton;
@property (weak, nonatomic) IBOutlet GradientButton *enterButton;

@property (weak, nonatomic) IBOutlet GradientButton *sinButton;
@property (weak, nonatomic) IBOutlet GradientButton *cosineButton;
@property (weak, nonatomic) IBOutlet GradientButton *tanButton;
@property (weak, nonatomic) IBOutlet GradientButton *logButton;
@property (weak, nonatomic) IBOutlet GradientButton *piButton;
@property (weak, nonatomic) IBOutlet GradientButton *eButton;
@property (weak, nonatomic) IBOutlet GradientButton *sqrtButton;
@property (weak, nonatomic) IBOutlet GradientButton *naturalLogButton;

@property (weak, nonatomic) IBOutlet GradientButton *plusButton;
@property (weak, nonatomic) IBOutlet GradientButton *minusButton;
@property (weak, nonatomic) IBOutlet GradientButton *multiplyButton;
@property (weak, nonatomic) IBOutlet GradientButton *divideButton;
@property (weak, nonatomic) IBOutlet GradientButton *plusMinusButton;

@property (weak, nonatomic) IBOutlet GradientButton *clearButton;
@property (weak, nonatomic) IBOutlet GradientButton *backspaceButton;
@property (weak, nonatomic) IBOutlet GradientButton *decimalButton;

@end
