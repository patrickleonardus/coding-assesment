//
//  MenuController.m
//  ObjcC Test
//
//  Created by Patrick Leonardus on 14/10/20.
//  Copyright © 2020 BOSSPAT. All rights reserved.
//

#import "MenuController.h"

@interface MenuController ()

@end

@implementation MenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)vendingMachineBtn:(id)sender {
    [self performSegueWithIdentifier:@"goToVendingMachine" sender:self];
}

- (IBAction)songsListBtn:(id)sender {
    [self performSegueWithIdentifier:@"goToSongsList" sender:self];
}


@end
