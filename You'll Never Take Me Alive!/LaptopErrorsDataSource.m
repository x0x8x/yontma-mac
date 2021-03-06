//
//  LaptopErrorsDataSource.m
//  You'll Never Take Me Alive!
//
//  Created by Tom on 2/19/14.
//  Copyright (c) 2014 iSEC Partners. All rights reserved.
//

#import "LaptopErrorsDataSource.h"

@implementation LaptopErrorsDataSource

- (id) initWithData:(ErrorStates)data
{
    self = [super init];
    
    self.errors = data;
    
    return self;
}

- (int)numberOfRowsInTableView:(NSTableView *)tableView
{
    int c =
        (self.errors & FileVaultError ? 1 : 0) +
        (self.errors & PowerSettingsError ? 1 : 0);
    return c;
}
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(int)row
{
    static NSString* ps = @"Power Settings are currently insecure";
    static NSString* fv = @"Disk Encryption (FileVault) is not enabled";
    
    if(self.errors & FileVaultError && self.errors & PowerSettingsError)
    {
        if(row == 0)
            return ps;
        else
            return fv;
    }
    else if(self.errors == FileVaultError)
        return fv;
    else
        return ps;
}

@end
