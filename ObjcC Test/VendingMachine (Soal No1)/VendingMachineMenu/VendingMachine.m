//
//  ViewController.m
//  ObjcC Test
//
//  Created by Patrick Leonardus on 14/10/20.
//  Copyright © 2020 BOSSPAT. All rights reserved.
//

#import "VendingMachine.h"
#import "Product.h"
#import "DetailProductController.h"

@interface VendingMachine ()

@property (strong,nonatomic) NSMutableArray<Product *> *products;
@property (strong,nonatomic) Product *selectedProduct;

@end

@implementation VendingMachine

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupProduct];
}

-(void) setupProduct{
    
    self.products = NSMutableArray.new;
    
    Product *product1 = Product.new;
    product1.productId = @(1);
    product1.name = @"Pocari Sweat";
    product1.price = @(10000);
    product1.stock = @(1);
    
    Product *product2 = Product.new;
    product2.productId = @(2);
    product2.name = @"Aqua";
    product2.price = @(5000);
    product2.stock = @(20);
    
    Product *product3 = Product.new;
    product3.productId = @(3);
    product3.name = @"Teh Botol";
    product3.price = @(7000);
    product3.stock = @(10);
    
    
    
    [self.products addObject:product1];
    [self.products addObject:product2];
    [self.products addObject:product3];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"goToProductDetail"]){
        DetailProductController *dest = [segue destinationViewController];
        dest.productData = self.selectedProduct;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Product *product = self.products[indexPath.row];
    
    static NSString *cellIdentifier = @"productCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = product.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%s %@","Rp.",product.price];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _selectedProduct = _products[indexPath.row];
    
    [self performSegueWithIdentifier:@"goToProductDetail" sender:self];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
