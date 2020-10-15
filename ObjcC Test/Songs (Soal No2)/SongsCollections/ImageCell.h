//
//  ImageCell.h
//  ObjcC Test
//
//  Created by Patrick Leonardus on 14/10/20.
//  Copyright © 2020 BOSSPAT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageCell;
@property (weak, nonatomic) IBOutlet UILabel *nameCell;
@property (weak, nonatomic) IBOutlet UILabel *albumCell;

@end

NS_ASSUME_NONNULL_END
