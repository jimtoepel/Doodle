//
//  Document.h
//  Doodle
//
//  Created by Jim Toepel on 4/26/15.
//  Copyright (c) 2015 FunderDevelopment. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument

@property (nonatomic) NSMutableArray *tasks;

@property (nonatomic) IBOutlet NSTableView *taskTable;

- (IBAction)addTask:(id)sender;


@end

