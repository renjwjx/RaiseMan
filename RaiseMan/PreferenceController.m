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

NSString * const BNRTableBgColorKey = @"BNRTableBackgroundColor";
NSString * const BNREmptyDocKey = @"BNREmptyDocumentFlag";

- (instancetype)init
{
    self = [super initWithWindowNibName:@"Preference"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [colorwell setColor:[PreferenceController preferenceTableBgColor]];
    [checkbox setState:[PreferenceController preferenceEmptyDoc]];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)changeBackgroundcolor:(id)sender
{
    NSColor *color = [colorwell color];
    [PreferenceController setPreferenceTableBgColor:color];
    NSLog(@"Color changed: %@", color);
}

- (void)changeNewEmptyDoc:(id)sender
{
    NSInteger state = [checkbox state];
    [PreferenceController setPreferenceEmptyDoc:state];
    NSLog(@"Checkbox changed %ld", state);
}

+ (NSColor*)preferenceTableBgColor
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *colorAsdata = [defaults objectForKey:BNRTableBgColorKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData:colorAsdata];
}

+ (void)setPreferenceTableBgColor:(NSColor *)color
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [defaults setObject:colorAsData forKey:BNRTableBgColorKey];
}

+ (BOOL)preferenceEmptyDoc
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:BNREmptyDocKey];
}

+(void)setPreferenceEmptyDoc:(BOOL)emptyDoc
{
    [[NSUserDefaults standardUserDefaults] setBool:emptyDoc forKey:BNREmptyDocKey];
}

@end
