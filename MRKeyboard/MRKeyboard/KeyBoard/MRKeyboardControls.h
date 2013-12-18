//
//  MRKeyboardControls.h
//  MRKeyboard
//
//  Created by Manish Rathi on 03/12/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import <UIKit/UIKit.h>
#import "MRKeyboardProtocol.h"
@interface MRKeyboardControls : UIView

// Text fields array
@property (nonatomic, strong) NSArray *textFields;

// Currently active text field
@property (nonatomic, strong) id activeTextField;


/*
 * IBOutlets
 */
@property (weak, nonatomic) IBOutlet UIButton *btnPrevious;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnDone;

/*
 * MRKeyboard's-Controller Delegate
 */
@property(nonatomic, weak) id<MRKeyboardProtocol> controller;

/*
 * Custom Init
 */
-(id)initWithTextFields:(NSArray *)fields andController:(id<MRKeyboardProtocol>)delegate;

/*
 * Reload text fields ----setup inputAccessoryView here
 */
- (void)reloadTextFields;
@end