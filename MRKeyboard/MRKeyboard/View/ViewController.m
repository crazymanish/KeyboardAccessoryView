//
//  ViewController.m
//  MRKeyboard
//
//  Created by Manish Rathi on 03/12/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import "ViewController.h"
#import "MRKeyboardControls.h"
@interface ViewController ()<MRKeyboardProtocol,UITextFieldDelegate>{
    MRKeyboardControls *keyboardcontrolsView;
}
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	
    //Setup keyboard here
    [self setupKeyboard];
}


#pragma mark - SetupKeyboard
#pragma mark -------------------------------------
-(void)setupKeyboard{
    NSArray *textFieldsArray=[NSArray arrayWithObjects:_txtFieldOne,_txtFieldTwo,_txtFieldThree,_txtFieldFour,nil];
    keyboardcontrolsView=[[MRKeyboardControls alloc] initWithTextFields:textFieldsArray andController:self];
}

#pragma mark - Text-Field Delegate
#pragma mark -------------------------------------
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([keyboardcontrolsView.textFields containsObject:textField])
        keyboardcontrolsView.activeTextField = textField;
}

#pragma mark - Keyboard Control Delegates
#pragma mark -------------------------------------
-(void)keyboardControlsPreviousBtnPressed:(MRKeyboardControls *)controls withActiveTextField:(UITextField *)textField{
    NSLog(@"Previous Btn Pressed");
    //@Manish ---- Now, do any aditional operations for activeTextFields
}
-(void)keyboardControlsNextBtnPressed:(MRKeyboardControls *)controls withActiveTextField:(UITextField *)textField{
    NSLog(@"Next Btn Pressed");
    //@Manish ---- Now, do any aditional operations for activeTextFields
}
-(void)keyboardControlsDonePressed:(MRKeyboardControls *)controls{
    NSLog(@"Done Btn Pressed");
    //@Manish ---- Now, do any aditional operations (Keyboard is going down)
}
@end