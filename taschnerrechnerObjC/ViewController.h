//
//  ViewController.h
//  taschnerrechnerObjC
//
//  Created by Magnus Kruschwitz on 14.07.19.
//  Copyright © 2019 Magnus Kruschwitz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

//Outlets
@property (weak) IBOutlet NSTextField *input1;
@property (weak) IBOutlet NSTextField *input2;
@property (weak) IBOutlet NSButton *radAdd;
@property (weak) IBOutlet NSButton *radSub;
@property (weak) IBOutlet NSButton *radMulti;
@property (weak) IBOutlet NSButton *radDivi;
@property (weak) IBOutlet NSTextField *labResult;

//Actions
- (IBAction)btnCloseClicked:(id)sender;
- (IBAction)btnCalcClicked:(id)sender;

//own function
- (double) stringToDouble:(NSString*) sInput;

@end

