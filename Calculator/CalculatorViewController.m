//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Mike Griffiths on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL containsADecimalPoint;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize description = _logField;
@synthesize display = _displayResult;
@synthesize nineButton = _nine;
@synthesize eightButton = _eightButton;
@synthesize sevenButton = _sevenButton;
@synthesize sixButton = _sixButton;
@synthesize fiveButton = _fiveButton;
@synthesize fourButton = _fourButton;
@synthesize threeButton = _threeButton;
@synthesize twoButton = _twoButton;
@synthesize oneButton = _oneButton;
@synthesize zeroButton = _zeroButton;
@synthesize enterButton = _enterButton;
@synthesize sinButton = _sinButton;
@synthesize cosineButton = _cosineButton;
@synthesize tanButton = _tanButton;
@synthesize logButton = _logButton;
@synthesize piButton = _piButton;
@synthesize eButton = _eButton;
@synthesize sqrtButton = _sqrtButton;
@synthesize naturalLogButton = _naturalLogButton;
@synthesize plusMinusButton = _plusMinusButton;
@synthesize plusButton = _plusButton;
@synthesize minusButton = _minusBytton;
@synthesize multiplyButton = _multiplyButton;
@synthesize divideButton = _divideButton;
@synthesize clearButton = _clearButton;
@synthesize backspaceButton = _backspaceButton;
@synthesize decimalButton = _decimalButton;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize containsADecimalPoint = _containsADecimalPoint;
@synthesize brain = _brain;

-(CalculatorBrain *)brain
{
    if(!_brain) 
    {
        _brain = [[CalculatorBrain alloc] init];
    }
    return _brain;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"carbon_fibre"]]];   
    [self.zeroButton useBlackStyle];
    [self.oneButton useBlackStyle];
    [self.twoButton useBlackStyle];
    [self.threeButton useBlackStyle];
    [self.fourButton useBlackStyle];
    [self.fiveButton useBlackStyle];
    [self.sixButton useBlackStyle];
    [self.sevenButton useBlackStyle];
    [self.eightButton useBlackStyle];
    [self.nineButton useBlackStyle];
    [self.enterButton useGreenConfirmStyle];
    [self.plusButton useAlertStyle];    
    [self.minusButton useAlertStyle];    
    [self.multiplyButton useAlertStyle];    
    [self.divideButton useAlertStyle];    
    [self.plusMinusButton useAlertStyle];    

    [self.sinButton useAlertStyle];    
    [self.cosineButton useAlertStyle];    
    [self.tanButton useAlertStyle];    
    [self.logButton useAlertStyle];    
    [self.piButton useAlertStyle];    
    [self.eButton useAlertStyle];    
    [self.sqrtButton useAlertStyle];    
    [self.naturalLogButton useAlertStyle];    
    [self.clearButton useRedDeleteStyle];    
    [self.backspaceButton useRedDeleteStyle];  
    
    [self.decimalButton useBlackStyle];
}

-(void)addToDescription:(NSString *)field
{
    if([field isEqualToString:@"+/-"]) {
        if([self.description.text hasSuffix:@"+/-"]) {
            self.description.text = [self.description.text substringToIndex:([self.description.text length] - 4)];
            return;
        }
    }
    NSString* newDescription = [[self.description.text stringByAppendingString:@" "] stringByReplacingOccurrencesOfString:@" =" withString:@""];
    self.description.text = [newDescription stringByAppendingString:field];
}

- (IBAction)backspacePressed {
    if(self.userIsInTheMiddleOfEnteringANumber) {
        if([self.display.text length] > 1) {
            NSString *newDisplay = [self.display.text substringToIndex:([self.display.text length] - 1)];
            self.display.text = [self.display.text substringToIndex:([self.display.text length] - 1)];
            if([newDisplay isEqualToString:@"0"]) {
                self.userIsInTheMiddleOfEnteringANumber = NO;
            }
        } else {
            self.display.text = @"0";  
            self.userIsInTheMiddleOfEnteringANumber = NO;
        }
        NSRange found = [self.display.text rangeOfString:@"."];
        if(found.location == NSNotFound) {
           self.containsADecimalPoint = NO; 
        }
    }
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    [self addToDescription:self.display.text];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.containsADecimalPoint = NO;
}

- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit = [sender currentTitle];
    if(self.userIsInTheMiddleOfEnteringANumber && self.display.text ) {
        self.display.text = [self.display.text stringByAppendingString:digit]; 
    } else {
        if(![digit isEqualToString:@"0"]) {
            self.display.text = digit;
            self.userIsInTheMiddleOfEnteringANumber = YES;
        }
    }
}

- (IBAction)decimalPointPressed {
    if(!self.containsADecimalPoint) {
        if(!self.userIsInTheMiddleOfEnteringANumber) {
            self.display.text = @"0.";
            self.userIsInTheMiddleOfEnteringANumber = YES;
        } else {
            self.display.text = [self.display.text stringByAppendingString:@"."];
        }
        self.containsADecimalPoint = YES;
    }
}

- (IBAction)clearPressed {
    self.display.text = @"0";
    self.description.text = @"";
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.containsADecimalPoint = NO;    
    [self.brain clear];
}

-(void) operationPressed:(Operation)opcode {
    if(self.userIsInTheMiddleOfEnteringANumber) 
    {
        [self enterPressed];
    }
    double result = [self.brain performOperation:opcode];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)sinPressed {
    [self operationPressed:OpSine];
    [self addToDescription:@"sin ="];
}

- (IBAction)cosPressed {
    [self operationPressed:OpCosine];
    [self addToDescription:@"cos ="];
}

- (IBAction)tanPressed {
    [self operationPressed:OpTan];
    [self addToDescription:@"tan ="];
}

- (IBAction)sqrtPressed {
    [self operationPressed:OpSquareroot];
    [self addToDescription:@"\u221A ="];
}

- (IBAction)naturalLogPressed {
    [self operationPressed:OpNaturalLog];
    [self addToDescription:@"ln ="];
}

- (IBAction)logPressed {
    [self addToDescription:@"log ="];
    [self operationPressed:OpLogten];
}

- (IBAction)piPressed {
    [self operationPressed:OpPi];
    [self addToDescription:@"\u03C0 ="];
}

- (IBAction)ePressed {
    [self operationPressed:OpE];
    [self addToDescription:@"e ="];
}

- (IBAction)plusMinusPressed {
    if(self.userIsInTheMiddleOfEnteringANumber) 
    {
        NSString * currentText = self.display.text;
        NSRange found = [currentText rangeOfString:@"-"];
        if(found.location == NSNotFound) {
            self.display.text = [@"-" stringByAppendingString:self.display.text];
        } else {
            self.display.text = [self.display.text substringFromIndex:1];
        }
    } else {
        [self operationPressed:OpPlusMinus];
        [self addToDescription:@"+/-"];
    }
}

- (IBAction)minusPressed {
    [self operationPressed:OpSubtract];
    [self addToDescription:@"- ="];
}

- (IBAction)multiplyPressed {
    [self operationPressed:OpMultiply];
    [self addToDescription:@"* ="];
}


- (IBAction)plusPressed {
    [self operationPressed:OpAdd];
    [self addToDescription:@"+ ="];
}

- (IBAction)dividePressed {
    [self operationPressed:OpDivide];
    [self addToDescription:@"\u00F7 ="];
}

- (void)viewDidUnload {
    [self setDescription:nil];
    [self setDisplay:nil];
    [self setNineButton:nil];
    [self setEightButton:nil];
    [self setSevenButton:nil];
    [self setSixButton:nil];
    [self setFiveButton:nil];
    [self setFourButton:nil];
    [self setThreeButton:nil];
    [self setTwoButton:nil];
    [self setOneButton:nil];
    [self setZeroButton:nil];
    [self setEnterButton:nil];
    [self setSinButton:nil];
    [self setPlusButton:nil];
    [self setMinusButton:nil];
    [self setMultiplyButton:nil];
    [self setDivideButton:nil];
    [self setPlusMinusButton:nil];
    [self setClearButton:nil];
    [self setCosineButton:nil];
    [self setTanButton:nil];
    [self setLogButton:nil];
    [self setPiButton:nil];
    [self setEButton:nil];
    [self setSqrtButton:nil];
    [self setNaturalLogButton:nil];
    [self setPlusMinusButton:nil];
    [self setBackspaceButton:nil];
    [self setDecimalButton:nil];
    [super viewDidUnload];
}
@end
