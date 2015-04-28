//
//  Document.m
//  Doodle
//
//  Created by Jim Toepel on 4/26/15.
//  Copyright (c) 2015 FunderDevelopment. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

#pragma mark - NSDocument Overrides


- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
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
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}


# pragma mark - Actions


-(void) addTask:(id)sender
{
    //if there is no array yet, add one
    if (!self.tasks) {
        self.tasks = [NSMutableArray array];
    }
    
    [self.tasks addObject:@"New Item"];
    
    // reloadData tells the table view to refresh and ask its dataSource
    // (which happens to be this BNR Doucment object)
    [self.taskTable reloadData];
    
    // updateChangeCount: tells the app whether or not the document has unsaved changes, NSChangeDone flags the document as unsaved
    [self updateChangeCount:NSChangeDone];
}


# pragma mark - Data Source Methods

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tv
{
    // This table view displays the tasks array, so the number of entires in the table view will == the number of entries in the array
    
    return [self.tasks count];
}

-(id)tableView:(NSTableView *)tableView
    objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    // Return the items from tasks that correspond with the cell that the table view wants to display
    return [self.tasks objectAtIndex:row];
}

-(void)tableView:(NSTableView *)tableview
setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    // when the user changes a task on the table view, update the tasks array
    
    [self.tasks replaceObjectAtIndex:row withObject:object];
    
    // and then flag the document as having unsaved changes
    [self updateChangeCount:NSChangeDone];
}


@end
