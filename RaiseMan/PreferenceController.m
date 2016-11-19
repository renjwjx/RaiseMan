//
//  PreferenceController.m
//  RaiseMan
//
//  Created by jinren on 19/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "PreferenceController.h"

@interface PreferenceController ()

@end

@implementation PreferenceController

- (instancetype)init
{
    self = [super initWithWindowNibName:@"Preference"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)changeBackgroundcolor:(id)sender
{
    NSColor *color = [colorwell color];
    NSLog(@"Color changed: %@", color);
}

- (void)changeNewEmptyDoc:(id)sender
{
    NSInteger state = [checkbox state];
    NSLog(@"Checkbox changed %ld", state);
}

@end
