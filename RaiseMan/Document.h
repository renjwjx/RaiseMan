//
//  Document.h
//  RaiseMan
//
//  Created by jinren on 19/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Document : NSDocument
@property (readwrite, nonatomic, strong) NSMutableArray *employees;
@property (readwrite, weak) IBOutlet NSArrayController *employeeController;

- (IBAction)removeEmployees:(id)sender;

@end

