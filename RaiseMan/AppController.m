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

+ (void)initialize
{
    NSMutableDictionary *defaultValue = [NSMutableDictionary dictionary];
    
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:[NSColor yellowColor]];
    
    [defaultValue setObject:colorAsData forKey:BNRTableBgColorKey];
    [defaultValue setObject:[NSNumber numberWithBool:YES] forKey:BNREmptyDocKey];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValue];
}

//NSApplicationDidResignActiveNotification
- (void)applicationDidResignActive:(NSNotification *)notification
{
    NSBeep();
    NSLog(@"applicationDidResignActive");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    NSLog(@"applicationWillTerminated");
}

@end
