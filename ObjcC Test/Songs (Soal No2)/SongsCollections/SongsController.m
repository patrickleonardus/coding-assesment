//
//  ViewController.m
//  ObjcC Test
//
//  Created by Patrick Leonardus on 12/10/20.
//  Copyright © 2020 BOSSPAT. All rights reserved.
//

#import "SongsController.h"
#import "ImageCell.h"
#import "DetailSongController.h"

@interface SongsController ()

@property(strong,nonatomic) IBOutlet UICollectionView *collectionView;
@property(strong,nonatomic) NSArray *imageArray;
@property(strong,nonatomic) NSArray *artistNameArr;
@property(strong,nonatomic) NSArray *artistAlbumArr;

@property(strong,nonatomic) NSString *selectedImage;
@property(strong,nonatomic) NSString *selectedName;
@property(strong,nonatomic) NSString *selectedAlbum;

@end

@implementation SongsController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageArray = [NSArray arrayWithObjects:@"raisa.jpeg",@"isyana.jpeg",@"ladygaga.jpg",@"rizkyfebian.jpeg",@"lyodra.jpeg",@"samsmith.jpg",@"hotline.jpg",@"brisia.jpg",@"marion.jpeg",@"noah.jpg", nil];
    
    self.artistNameArr = @[@"Raisa",@"Isyana",@"Lady Gaga",@"Rizky Febian",@"Lyodra",@"Sam Smith",@"Drake",@"Brisia Jodie",@"Marion Jola",@"Noah"];
    
    self.artistAlbumArr = @[@"Handmade",@"Explore",@"The Fame",@"Cuek",@"Lyodra",@"In The Lonely Hour",@"Hotline Bling",@"Kisahku",@"Marion",@"Second Chance"];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"goToDetailSong"]){
        DetailSongController *dest = [segue destinationViewController];
        dest.detailSelectedImage = _selectedImage;
        dest.detailSelectedName = _selectedName;
        dest.detailSelectedAlbum = _selectedAlbum;
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count;
}
 
 
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"imageCell";
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIImageView *imageCell = (UIImageView *)[cell viewWithTag:100];
    imageCell.image = [UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
    cell.nameCell.text = [self.artistNameArr objectAtIndex:indexPath.row];
    cell.albumCell.text = [self.artistAlbumArr objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *) indexPath{
    self.selectedImage = [self.imageArray objectAtIndex:indexPath.row];
    self.selectedName = [self.artistNameArr objectAtIndex:indexPath.row];
    self.selectedAlbum = [self.artistAlbumArr objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"goToDetailSong" sender:self];
}



@end
