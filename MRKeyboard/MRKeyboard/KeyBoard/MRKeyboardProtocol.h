//
//  MRKeyboardProtocol.h
//  MRKeyboard
//
//  Created by Manish Rathi on 03/12/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  MRKeyboardControls;
@protocol MRKeyboardProtocol <NSObject>

@optional
 // Previous button pressed
-(void)keyboardControlsPreviousBtnPressed:(MRKeyboardControls *)controls withActiveTextField:(UITextField *)textField;
 // Next button pressed
-(void)keyboardControlsNextBtnPressed:(MRKeyboardControls *)controls withActiveTextField:(UITextField *)textField;
// Done button pressed
-(void)keyboardControlsDonePressed:(MRKeyboardControls *)controls;
@end