//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Mike Griffiths on 29/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
#import "Math.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack
{
    if(!_operandStack) 
    {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

-(double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject)
    {
        [self.operandStack removeLastObject];
    }
    return [operandObject doubleValue];
}

-(double)performOperation:(Operation) operation
{
    double result = 0;
    switch (operation) {
        case OpAdd:
            result = [self popOperand] + [self popOperand];
            break;
        case OpMultiply:
            result = [self popOperand] * [self popOperand];
            break;
        case OpSubtract:
            {
                double subtrahend = [self popOperand];
                result = [self popOperand] - subtrahend;
            }
            break;
        case OpDivide:
            {
                double divisor = [self popOperand];
                if(divisor) {
                    result = [self popOperand] / divisor;
                }
            }
            break;

        case OpSine : 
            {
                double angle = [self popOperand];
                if(angle) {
                    result = sin(M_PI/180*angle);
                } else {
                    result = sin(0);
                }
            }
            break;
            
        case OpCosine : 
            {
                double angle = [self popOperand];
                if(angle) {
                    result = cos(M_PI/180*angle);
                } else {
                    result = cos(0);
                }
            }
            break;
            
        case OpTan : 
            {
                double angle = [self popOperand];
                if(angle) {
                    result = tan(M_PI/180*angle);
                } else {
                    result = tan(0);
                }
            }
            break;
        case OpLogten : 
            result = [self popOperand];
            result = log10(result);
            break;
            
        case OpSquareroot: 
            {
                double number = [self popOperand];
                if(number >= 0) {
                    result = sqrt(number);
                }
            }
            break;
            
        case OpNaturalLog: 
            result = [self popOperand];
            result = log(result);
            break;
            
        case OpPi:  
            result = M_PI;
            break;
            
        case OpE:  
            result = M_E;
            break;
            
        case OpPlusMinus:  
            result = [self popOperand];
            result = 0 - result;
            break;
            
        default:
            break;
    }
    [self pushOperand:result];
    return result;
}

-(void) clear
{
    [self.operandStack removeAllObjects];
}

@end
