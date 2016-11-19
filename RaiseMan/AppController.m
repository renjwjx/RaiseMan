//
//  AppController.m
//  RaiseMan
//
//  Created by jinren on 19/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"

@implementation AppController


-(IBAction)showPreferencePanel:(id)sender
{
    if (!preferenceontroller) {
        preferenceontroller = [[PreferenceController alloc] init];
    }
    [preferenceontroller showWindow:self];
}

@end
