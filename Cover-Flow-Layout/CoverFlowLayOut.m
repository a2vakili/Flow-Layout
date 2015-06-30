//
//  CoverFlowLayOut.m
//  Cover-Flow-Layout
//
//  Created by Arsalan Vakili on 2015-06-26.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "CoverFlowLayOut.h"

#define Item_Size 70.0

@implementation CoverFlowLayOut

-(void) prepareLayout{
    [super prepareLayout];
    
    CGSize size= self.collectionView.frame.size;
    
    _cellCount= [[self collectionView] numberOfItemsInSection:0];
    
    _center= CGPointMake(size.width/2, size.height/2);
    
    _radius= MIN(size.width, size.height)/2.5;
}

-(CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes= [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size= CGSizeMake(Item_Size, Item_Size);
    attributes.center= CGPointMake(_center.x +_radius *cosf(2 * indexPath.item * M_PI/_cellCount), _center.y +_radius *sinf(2 * indexPath.item * M_PI/_cellCount));
    
    return attributes;
}

-(NSArray *) layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes= [NSMutableArray array];
    
    for (NSInteger i=0 ; i< self.cellCount; i++) {
        NSIndexPath *indexPath= [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}


@end
