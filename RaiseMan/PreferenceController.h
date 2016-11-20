//
//  PreferenceController.h
//  RaiseMan
//
//  Created by jinren on 19/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferenceController : NSWindowController
{
    IBOutlet NSColorWell *colorwell;
    IBOutlet NSButton *checkbox;
}

-(IBAction)changeBackgroundcolor:(id)sender;
-(IBAction)changeNewEmptyDoc:(id)sender;

extern NSString * const BNRTableBgColorKey;
extern NSString * const BNREmptyDocKey;

+ (NSColor *)preferenceTableBgColor;
+ (void)setPreferenceTableBgColor:(NSColor *)color;
+ (BOOL)preferenceEmptyDoc;
+ (void)setPreferenceEmptyDoc:(BOOL)emptyDoc;


@end
