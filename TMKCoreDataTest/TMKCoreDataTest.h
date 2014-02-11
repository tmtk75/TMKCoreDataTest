//
//  TMKCoreDataTest.h
//  TMKCoreDataTest
//
//  Created by Tomotaka Sakuma on 2014/02/11.
//  Copyright (c) 2014 Tomotaka Sakuma. All rights reserved.
//
#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface TMKCoreDataTest : XCTestCase

@property (retain) NSManagedObjectModel *managedObjectModel;
@property (retain) NSPersistentStoreCoordinator *storeCoordinator;
@property (retain) NSPersistentStore *store;
@property (retain) NSManagedObjectContext *managedObjectContext;

- (id)newObject:(NSString *)name;
- (NSArray *)fetch:(NSString *)name;
- (NSArray *)fetch:(NSString *)name withPredicate:(NSPredicate *)pred;
- (NSArray *)fetch:(NSString *)name with:(NSString *)fmt, ...;
- (NSArray *)fetch:(NSString *)name with:(NSString *)fmt arguments:(va_list)args;
- (NSArray *)fetchNotes:(NSString *)fmt, ...;

@end