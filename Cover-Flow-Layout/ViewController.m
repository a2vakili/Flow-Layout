//
//  ViewController.m
//  Cover-Flow-Layout
//
//  Created by Arsalan Vakili on 2015-06-26.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "CoverFlowLayOut.h"

@interface ViewController (){
    NSArray *arrayOfImages;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UITapGestureRecognizer *tapRecognizer= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handelTabGesture:)];
//    [self.collectionView addrGestureRecognizer:tapRecognizer];
    [self.collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.collectionView reloadData];
   
     
    
    arrayOfImages= @[@"image-1i",@"image-2",@"image-3", @"image-4",@"image-5",@"image-6",@"image-7",@"image-8",@"image-9"];
    
}


-(void)handelTabGesture:(UITapGestureRecognizer *) sender{
    if (sender.state == UIGestureRecognizerStateEnded) {
    }
}
//        CGPoint intialTipPoint= [sender locationInView:self.collectionView];
//        NSIndexPath *tappedCellPath= [self.collectionView indexPathForItemAtPoint:intialTipPoint];
//        if (tappedCellPath != nil) {
//            [self.collectionView performBatchUpdates:^ completion:]
//        }
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayOfImages count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImage *img = [UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]];
    [[cell imageViewFlow] setImage:img];
    
    return cell;
}

//-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    CustomCell *aCell= (CustomCell*) cell;
//    aCell.imageViewFlow  = [[UIImageView alloc] initWithFrame:cell.frame];
//    UIImage *img = [UIImage imageNamed:[arrayOfImages objectAtIndex:indexPath.item]];
//    [[aCell imageViewFlow] setImage:img];
//}

@end
