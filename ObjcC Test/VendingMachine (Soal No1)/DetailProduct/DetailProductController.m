//
//  DetailProductController.m
//  ObjcC Test
//
//  Created by Patrick Leonardus on 14/10/20.
//  Copyright © 2020 BOSSPAT. All rights reserved.
//

#import "DetailProductController.h"

@interface DetailProductController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UILabel *stockLbl;
@property (weak, nonatomic) IBOutlet UILabel *balanceLbl;
@property (weak, nonatomic) IBOutlet UILabel *validationLbl;
@property (weak, nonatomic) IBOutlet UIButton *twoThousandOutlet;
@property (weak, nonatomic) IBOutlet UIButton *fiveThousandOutlet;
@property (weak, nonatomic) IBOutlet UIButton *tenThousandOutlet;
@property (weak, nonatomic) IBOutlet UIButton *twentyThousandOutlet;


@end

@implementation DetailProductController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self onStockCheck];
    
    _currMoney = @(0);
    
    _balanceLbl.text = [NSString stringWithFormat:@"%s %@","Balance :",_currMoney];
    _nameLbl.text = _productData.name;
    _priceLbl.text = [NSString stringWithFormat:@"%s %@", "Rp.", _productData.price];
    _stockLbl.text = [NSString stringWithFormat:@"%s %@", "Sisa", _productData.stock];
    
}

-(void)onShowAlert: (NSString *) body{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Succeed"
                                 message:body
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
        
    }];
    
    [alert addAction:yesButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)onStockCheck{
    
    NSInteger stock = [_productData.stock intValue];
    
    if(stock == 0){
        _twoThousandOutlet.enabled = NO;
        _fiveThousandOutlet.enabled = NO;
        _tenThousandOutlet.enabled = NO;
        _twentyThousandOutlet.enabled = NO;
        
        _validationLbl.text = @"Product out of stock";
        _validationLbl.alpha = 1;
    }
}

-(void)onPriceClicked: (NSNumber *) productPrice{
    NSInteger temp = [productPrice intValue];
    _currMoney = @([_currMoney intValue] + temp);
    _balanceLbl.text = [NSString stringWithFormat:@"%s %@","Balance :",_currMoney];
    
    NSInteger money = [_currMoney intValue];
    NSInteger price = [_productData.price intValue];
    NSInteger stock = [_productData.stock intValue];
    
    
    if(stock != 0){
        if(money < price){
            _validationLbl.text = @"Your balance is not enough";
            _validationLbl.alpha = 1;
        }
        else {
            _validationLbl.alpha = 0;
            
            
            _currMoney = @(0);
            _balanceLbl.text = [NSString stringWithFormat:@"%s %@","Balance :",_currMoney];
            
            stock = stock - 1;
            _productData.stock = [NSNumber numberWithInt:stock];
            _stockLbl.text = [NSString stringWithFormat:@"%s %@", "Sisa", _productData.stock];
            
            [self onShowAlert:[NSString stringWithFormat:@"%s %@","Succeed buy", _productData.name]];
            [self onStockCheck];
        }
    }else {
        _validationLbl.text = @"Product out of stock";
        _validationLbl.alpha = 1;
    }
}


- (IBAction)twoThousandBtn:(id)sender {
    [self onPriceClicked:@(2000)];
}

- (IBAction)fiveThousandBtn:(id)sender {
    [self onPriceClicked:@(5000)];
}

- (IBAction)tenThousandBtn:(id)sender {
    [self onPriceClicked:@(10000)];
}

- (IBAction)twentyThousandBtn:(id)sender {
    [self onPriceClicked:@(20000)];
}


@end
