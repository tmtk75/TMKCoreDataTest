//
//  TMKCoreDataTest.m
//  TMKCoreDataTest
//
//  Created by Tomotaka Sakuma on 2014/02/11.
//  Copyright (c) 2014 Tomotaka Sakuma. All rights reserved.
//
#import "TMKCoreDataTest.h"

@implementation TMKCoreDataTest

- (void)setUp
{
    [super setUp];
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"toody" withExtension:@"momd"];
    _managedObjectModel   = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    _storeCoordinator     = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
    _store                = [_storeCoordinator addPersistentStoreWithType:NSInMemoryStoreType
                                                            configuration:nil
                                                                      URL:nil
                                                                  options:nil
                                                                    error:NULL];
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:_storeCoordinator];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (id)newObject:(NSString *)name
{
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:self.managedObjectContext];
}

- (NSArray *)fetch:(NSString *)name
{
    return [self fetch:name withPredicate:nil];
}

- (NSArray *)fetch:(NSString *)name withPredicate:(NSPredicate *)pred
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:name inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *fetchRequest = NSFetchRequest.new;
    [fetchRequest setEntity:entity];
    if (pred != nil) {
        [fetchRequest setPredicate:pred];
    }
    NSError *error;
    return [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

- (NSArray *)fetch:(NSString *)name with:(NSString *)fmt, ...
{
    va_list args;
    va_start(args, fmt);
    NSPredicate *pred = [NSPredicate predicateWithFormat:fmt arguments:args];
    return [self fetch:name withPredicate:pred];
}

- (NSArray *)fetch:(NSString *)name with:(NSString *)fmt arguments:(va_list)args
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:fmt arguments:args];
    return [self fetch:name withPredicate:pred];
}

- (NSArray *)fetchNotes:(NSString *)fmt, ...
{
    va_list args;
    va_start(args, fmt);
    return [self fetch:@"TSDNote" with:fmt arguments:args];
}

@end
