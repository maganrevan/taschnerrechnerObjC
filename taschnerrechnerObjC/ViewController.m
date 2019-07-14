//
//  ViewController.m
//  taschnerrechnerObjC
//
//  Created by Magnus Kruschwitz on 14.07.19.
//  Copyright © 2019 Magnus Kruschwitz. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)btnCloseClicked:(id)sender {
    [[NSApplication sharedApplication] terminate: self];
}

- (IBAction)btnCalcClicked:(id)sender {
    NSMutableArray *aCalculator = [[NSMutableArray alloc] initWithCapacity:0];
    [aCalculator addObject:[NSNumber numberWithDouble:[self stringToDouble:_input1.stringValue]]];
    [aCalculator addObject:[NSNumber numberWithDouble:[self stringToDouble:_input2.stringValue]]];
    NSString *error = @"Nicht definierbar";
    
    NSMutableArray *aOptions = [[NSMutableArray alloc] initWithCapacity:0];
    [aOptions addObject:_radAdd];
    [aOptions addObject:_radSub];
    [aOptions addObject:_radMulti];
    [aOptions addObject:_radDivi];
    
    for(NSInteger i = 0; i < aOptions.count; i++){
        if([aOptions[i] state] == YES){
            switch (i) {
                case 0:
                    _labResult.doubleValue = [aCalculator[0] floatValue] + [aCalculator[1] floatValue];
                    break;
                case 1:
                    _labResult.doubleValue = [aCalculator[0] floatValue] - [aCalculator[1] floatValue];
                    break;
                case 2:
                    _labResult.doubleValue = [aCalculator[0] floatValue] * [aCalculator[1] floatValue];
                    break;
                case 3:
                    if([aCalculator[1] floatValue] != 0){
                        _labResult.doubleValue = [aCalculator[0] floatValue] / [aCalculator[1] floatValue];
                    }
                    else{
                        _labResult.stringValue = error;
                    }
                    break;
                default:
                    break;
            }
        }
    }
    
    [_labResult sizeToFit];
}

- (double) stringToDouble:(NSString *) sInput{
    NSMutableString *result = [NSMutableString new];
    int counter = 0;
    
    for(NSInteger charIdx = 0; charIdx < sInput.length; charIdx++){
        NSString *cCurrent = [NSString stringWithFormat:@"%c", [sInput characterAtIndex:charIdx]];
        if([cCurrent  isEqual: @"."] || [cCurrent  isEqual: @","] ){
            counter++;
            if(counter <= 1){
                [result appendString:@"."];
            }
            else{
                [result appendString:@""];
            }
        }
        else{
            [result appendString:cCurrent];
        }
    }
    
    if(result.length > 0){
        return [result doubleValue];
    }
    else{
        return 0;
    }
}

@end
