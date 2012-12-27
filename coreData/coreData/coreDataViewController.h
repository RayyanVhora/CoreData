//
//  coreDataViewController.h
//  coreData
//
//  Created by Peerbits Solution on 01/11/12.
//  Copyright (c) 2012 Peerbits Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AppDelegate.h"
@interface coreDataViewController : UIViewController{
    UITextField *name;
    UITextField *address;
    UITextField *phone;
    UILabel     *status;

}

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UILabel *status;
- (IBAction) saveData;
- (IBAction) findContact;


@end
