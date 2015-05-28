//
//  HealthDetailTVC.h
//  HealthifyDemo
//
//  Created by Manoj Mashru on 5/27/15.
//  Copyright (c) 2015 Manoj Mashru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthDetailTVC : UITableViewController

@property(nonatomic,weak)IBOutlet UIScrollView *scrViewCalEaten,*scrViewCalBurnt;
@property(nonatomic,weak)IBOutlet UIPageControl *pageControlCalEaten,*pageControlCalBurn;
@property(nonatomic,weak)IBOutlet UIView *containerViewCalEaten,*containerViewCalBurnt;

@end
