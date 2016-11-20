//
//  Document.m
//  RaiseMan
//
//  Created by jinren on 19/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        _employees = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    //    [NSKeyedArchiver archivedDataWithRootObject:_employees];
    //    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return [NSKeyedArchiver archivedDataWithRootObject:_employees];;
}


- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    //    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    
    NSMutableArray *newArray = nil;
    @try {
        newArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    @catch(NSException *e) {
        if (outError) {
            NSDictionary *d = [NSDictionary dictionaryWithObject:@"The data is corrupted." forKey:NSLocalizedFailureReasonErrorKey];
            *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:d];
        }
        return NO;
    }
    [self setEmployees:newArray];
    
    return YES;
}

- (void)setEmployees:(NSMutableArray *)a
{
    if (a == _employees) {
        return;
    }
    _employees = a;
}

- (IBAction)removeEmployees:(id)sender
{
    //NSArray *selectPeoples = [_employeeController selectedObjects];
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"Stop"];
    [alert addButtonWithTitle:@"Abort"];
    [alert addButtonWithTitle:@"Delete"];
    [alert setMessageText:@"Do you really want to remove these people?"];
    [alert setInformativeText:@"Selected people will be removed."];
    [alert setAlertStyle:NSAlertStyleCritical];
    [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == NSAlertThirdButtonReturn)
        {
            //The array controller will delete the selected objects
            [_employeeController remove:nil];
        }
    }];

}

@end
