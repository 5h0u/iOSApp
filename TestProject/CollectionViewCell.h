//
//  CollectionViewCell.h
//  TestProject
//
//  Created by yamasaki.s on 2016/06/16.
//  Copyright © 2016年 yamasaki.s. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionViewDelegate <NSObject>

@required
-(void)pressDelete;
-(void)pressClose;

@end

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic)IBOutlet UILabel *titleLabel;
@property (weak, nonatomic)IBOutlet UILabel *dateLabel;
@property (weak, nonatomic)IBOutlet UIButton *deleteButton;
@property (weak, nonatomic)IBOutlet UIButton *closeButton;
@property (weak, nonatomic)id delegate;

+(CollectionViewCell *)collectionView;
-(IBAction)pressDelete:(id)sender;
-(IBAction)pressClose:(id)sender;

@end
