//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Mike Griffiths on 29/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum operation {
    OpAdd, 
    OpSubtract, 
    OpDivide, 
    OpMultiply, 
    OpSine, 
    OpCosine, 
    OpTan,
    OpLogten, 
    OpSquareroot, 
    OpNaturalLog,
    OpPi,
    OpE,
    OpPlusMinus
} Operation;

@interface CalculatorBrain : NSObject

- (void) pushOperand:(double)operand;
- (double) performOperation:(Operation)operation;
- (void) clear;

@end
