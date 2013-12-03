//
//  MRKeyboardControls.m
//  MRKeyboard
//
//  Created by Manish Rathi on 03/12/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import "MRKeyboardControls.h"

@implementation MRKeyboardControls

#pragma mark - Custom-Init
#pragma mark -------------------------------------
-(id)initWithTextFields:(NSArray *)fields andController:(id<MRKeyboardProtocol>)delegate{
    self = (MRKeyboardControls *)[[NSBundle mainBundle] loadNibNamed:@"MRKeyboardControls" owner:self options:nil][0];
    if (self) {
        _controller = delegate;
        _textFields=fields;
        
        //Set-AccessoryView
        [self reloadTextFields];
    }
    return self;
}

#pragma mark - IBActions
#pragma mark -------------------------------------
-(IBAction)handlePreviousBtn:(id)sender{
    int index = [_textFields indexOfObject:_activeTextField];
    if (index > 0){
        int previous = index-1;
        
        //Active Text-field
        _activeTextField = [_textFields objectAtIndex:previous];

        //Setup Controls
        [self setupControlsForActiveTextField:_activeTextField];
        
        //Become First Responder
        [_activeTextField becomeFirstResponder];
        
        //Call Delegate Now
        if (_controller && [_controller respondsToSelector:@selector(keyboardControlsPreviousBtnPressed:withActiveTextField:)]) {
            [_controller keyboardControlsPreviousBtnPressed:self withActiveTextField:_activeTextField];
        }
    }
}
-(IBAction)handleNextBtn:(id)sender{
    int index = [_textFields indexOfObject:_activeTextField];
    if (index < _textFields.count-1){
        int next = index+1;
        
         //Active Text-field
        _activeTextField = [_textFields objectAtIndex:next];
        
         //Setup Controls
        [self setupControlsForActiveTextField:_activeTextField];
        
        //Become First Responder
        [_activeTextField becomeFirstResponder];
        
        //Call Delegate Now
        if (_controller && [_controller respondsToSelector:@selector(keyboardControlsNextBtnPressed:withActiveTextField:)]) {
            [_controller keyboardControlsNextBtnPressed:self withActiveTextField:_activeTextField];
        }
    }
}
-(IBAction)handleDoneButton:(id)sender{
    //Resign First Responder
    [_activeTextField resignFirstResponder];
    
    //Call Delegate Now
    if (_controller && [_controller respondsToSelector:@selector(keyboardControlsDonePressed:)]) {
        [_controller keyboardControlsDonePressed:self];
    }
}

#pragma mark - setUp Controls
#pragma mark -------------------------------------
- (void)setupControlsForActiveTextField:(id)textField{
    int index = [self.textFields indexOfObject:textField];
    
    // setup "Previous" button
    if (index > 0)
        [_btnPrevious setEnabled:YES];
    else
        [_btnPrevious setEnabled:NO];
    
    // setup "Next" button
    if (index < self.textFields.count - 1)
        [_btnNext setEnabled:YES];
    else
        [_btnNext setEnabled:NO];
}

#pragma mark - Reload text-fields/text-views
#pragma mark -------------------------------------
- (void)reloadTextFields{
	for (id textField in self.textFields){
	    if ([textField isKindOfClass:[UITextField class]])
	        ((UITextField *) textField).inputAccessoryView = self;
	    else if ([textField isKindOfClass:[UITextView class]])
	        ((UITextView *) textField).inputAccessoryView = self;
	}
}

#pragma mark - Setter
#pragma mark -------------------------------------
//Active textField Setter
- (void)setActiveTextField:(id)activeTextField{
    _activeTextField = activeTextField;
    
    //Setup Controls
    [self setupControlsForActiveTextField:_activeTextField];
}

#pragma mark - dealloc
#pragma mark -------------------------------------
-(void)dealloc{
    _textFields=nil;
    _activeTextField=nil;
}
@end