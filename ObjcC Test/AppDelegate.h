//
//  AppDelegate.h
//  ObjcC Test
//
//  Created by Patrick Leonardus on 12/10/20.
//  Copyright © 2020 BOSSPAT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

