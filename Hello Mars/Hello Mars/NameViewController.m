//
//  NameViewController.m
//  Hello Mars
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Alicia M. F. Key
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "NameViewController.h"
#import "MarsViewController.h"


@interface NameViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end


@implementation NameViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.doneButton setTitle:@"Enter your name to proceed" forState:UIControlStateDisabled];
    [self.doneButton setTitle:@"Goto mars" forState:UIControlStateNormal];
    self.doneButton.enabled = NO;
    
    self.nameTextField.delegate = self;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (![[self.nameTextField text] isEqualToString:@""]) {
        self.doneButton.enabled = YES;
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MarsViewController *marsViewController = (MarsViewController *)segue.destinationViewController;
    marsViewController.nameString = self.nameTextField.text;
}


@end
