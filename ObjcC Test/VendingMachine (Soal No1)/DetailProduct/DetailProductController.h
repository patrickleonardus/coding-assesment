//
//  DetailProductController.h
//  ObjcC Test
//
//  Created by Patrick Leonardus on 14/10/20.
//  Copyright © 2020 BOSSPAT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailProductController : UIViewController

@property (strong,nonatomic) Product *productData;
@property (strong,nonatomic) NSNumber *currMoney;

@end

NS_ASSUME_NONNULL_END
