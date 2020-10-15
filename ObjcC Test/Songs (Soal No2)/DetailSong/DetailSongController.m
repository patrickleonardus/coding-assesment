//
//  DetailSongController.m
//  ObjcC Test
//
//  Created by Patrick Leonardus on 14/10/20.
//  Copyright © 2020 BOSSPAT. All rights reserved.
//

#import "DetailSongController.h"

@interface DetailSongController ()
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *detailName;
@property (weak, nonatomic) IBOutlet UILabel *detailAlbum;


@end

@implementation DetailSongController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.detailImage.image = [UIImage imageNamed:_detailSelectedImage];
    self.detailName.text = _detailSelectedName;
    self.detailAlbum.text = _detailSelectedAlbum;
    
}

@end
