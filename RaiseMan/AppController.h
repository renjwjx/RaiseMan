//
//  AppController.h
//  RaiseMan
//
//  Created by jinren on 19/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PreferenceController;

@interface AppController : NSObject
{
    PreferenceController *preferenceontroller;
}

-(IBAction)showPreferencePanel:(id)sender;

@end
