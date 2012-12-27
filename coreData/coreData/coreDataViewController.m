//
//  coreDataViewController.m
//  coreData
//
//  Created by Peerbits Solution on 01/11/12.
//  Copyright (c) 2012 Peerbits Solution. All rights reserved.
//

#import "coreDataViewController.h"

@interface coreDataViewController ()

@end

@implementation coreDataViewController
@synthesize name, address, phone, status;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Custom initialization
    }
    return self;
}



- (void) saveData
{
    
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Contacts"
                  inManagedObjectContext:context];
    [newContact setValue:name.text forKey:@"name"];
    [newContact setValue:address.text forKey:@"address"];
    [newContact setValue:phone.text forKey:@"phone"];
    name.text = @"";
    address.text = @"";
    phone.text = @"";
    NSError *error;
    [context save:&error];
    status.text = @"Contact saved";

    
}

- (void) findContact
{
    
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Contacts"
                inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(name = %@)",
     name.text];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    if ([objects count] == 0) {
        status.text = @"No matches";
    } else {
        matches = [objects objectAtIndex:0];
        address.text = [matches valueForKey:@"address"];
        phone.text = [matches valueForKey:@"phone"];
        status.text = [NSString stringWithFormat:
                       @"%d matches found", [objects count]];
    }

    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
