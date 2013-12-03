//
//  MRKeyboardControls.h
//  MRKeyboard
//
//  Created by Manish Rathi on 03/12/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

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