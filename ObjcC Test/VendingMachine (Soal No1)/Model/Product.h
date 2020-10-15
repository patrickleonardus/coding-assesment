//
//  Product.h
//  ObjcC Test
//
//  Created by Patrick Leonardus on 14/10/20.
//  Copyright © 2020 BOSSPAT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject

@property(nonatomic,strong) NSNumber *productId;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSNumber *price;
@property(nonatomic,strong) NSNumber *stock;



@end

NS_ASSUME_NONNULL_END
