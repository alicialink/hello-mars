//
//  MarsViewController.m
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

#import "MarsViewController.h"


@interface MarsViewController ()

@property (weak, nonatomic) UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *nameLabelView;

@end


@implementation MarsViewController


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setupNameLabel];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [self.nameLabel removeFromSuperview];
    self.nameLabel = nil;
}


- (void)setupNameLabel
{
    UILabel *localNameLabel = [UILabel new];
    localNameLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    localNameLabel.text = [[NSString alloc] initWithFormat:@"Happy Landing %@!", self.nameString];
    [localNameLabel sizeToFit];
    
    CGPoint destinationCenterPoint = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height * 0.75);
    CGPoint startCenterPoint = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.origin.y);
    localNameLabel.center = startCenterPoint;
    
    [self.nameLabelView addSubview:localNameLabel];
    self.nameLabel = localNameLabel;
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.13 initialSpringVelocity:0.0 options:0 animations:^{
        localNameLabel.center = destinationCenterPoint;
    } completion:nil];
}


@end
