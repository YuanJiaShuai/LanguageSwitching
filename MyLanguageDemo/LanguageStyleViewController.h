//
//  LanguageStyleViewController.h
//  LanguageSwitching
//
//  Created by apple on 16/12/5.
//  Copyright © 2016年 YJS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^changeLanguagBlock) (NSString *);

@interface LanguageStyleViewController : UIViewController

@property (strong, nonatomic) changeLanguagBlock changeLanguageBlock;

@end
