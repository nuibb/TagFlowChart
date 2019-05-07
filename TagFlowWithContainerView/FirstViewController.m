//
//  FirstViewController.m
//  TagFlowWithContainerView
//
//  Created by Steve JobsOne on 1/31/19.
//  Copyright © 2019 MobioApp Limited. All rights reserved.
//

#import "FirstViewController.h"
#import "ASJTagsView.h"

@interface FirstViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet ASJTagsView *tagsView;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;

- (void)setup;
- (void)handleTagBlocks;
- (void)showAlertMessage:(NSString *)message;
- (IBAction)addTapped:(id)sender;
- (IBAction)clearAllTapped:(id)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

#pragma mark - Setup

- (void)setup
{
    _tagsView.tagColorTheme = TagColorThemeStrawberry;
    [self handleTagBlocks];
    [_firstName becomeFirstResponder];
    [_lastName becomeFirstResponder];
    [_email becomeFirstResponder];
}

#pragma mark - Tag blocks

- (void)handleTagBlocks
{
    __weak typeof(self) weakSelf = self;
    [_tagsView setTapBlock:^(NSString *tagText, NSInteger idx)
     {
         NSString *message = [NSString stringWithFormat:@"You tapped: %@", tagText];
         [weakSelf showAlertMessage:message];
     }];
    
    [_tagsView setDeleteBlock:^(NSString *tagText, NSInteger idx)
     {
         NSString *message = [NSString stringWithFormat:@"You deleted: %@", tagText];
         [weakSelf showAlertMessage:message];
         [weakSelf.tagsView deleteTagAtIndex:idx];
     }];
}

- (void)showAlertMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tap!" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - IBActions

- (IBAction)addTapped:(id)sender
{
    if (![_firstName.text isEqualToString:@""] && ![_lastName.text isEqualToString:@""]) {
        
        [_tagsView addTag:[NSString stringWithFormat:@"%@ %@", _firstName.text, _lastName.text]];
        _firstName.text = nil;
        _lastName.text = nil;
        _email.text = nil;
        
    } else {
        
        
        
    }
}

- (IBAction)clearAllTapped:(id)sender
{
    [_tagsView deleteAllTags];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
