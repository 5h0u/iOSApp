//
//  CollectionViewCell.m
//  TestProject
//
//  Created by yamasaki.s on 2016/06/16.
//  Copyright © 2016年 yamasaki.s. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(void)pressDelete:(id)sender{
    if([_delegate respondsToSelector:@selector(pressDelete)])
        [_delegate pressDelete];
}
-(void)pressClose:(id)sender{
    if([_delegate respondsToSelector:@selector(pressClose:)])
        [_delegate pressClose];
}
@end
