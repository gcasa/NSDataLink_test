/* AppDelegate.m created by heron on Mon 04-Aug-2025 */

#import "AppDelegate.h"

@implementation AppDelegate

- (void) awakeFromNib
{
}

- (void) applicationDidFinishLaunching: (NSNotification *)n
{
  _datalinkManager = [[NSDataLinkManager alloc] initWithDelegate: self];
  NSLog(@"called");
}

- (void) dealloc
{
  [_datalinkManager release];
  [super dealloc];
}

// Datalink Delegate
- (BOOL) copyToPasteboard: (NSPasteboard *)pb at: (NSSelection *)selection cheapCopyAllowed: (BOOL)f
{
  return YES;
}

- (void) dataLinkManager: (NSDataLinkManager *)sender didBreakLink: (NSDataLink *)dl
{
  NSLog(@"Breaking %@", dl);
}

- (BOOL) dataLinkManager: (NSDataLinkManager *)sender isUpdateNeededForLink: (NSDataLink *)dl
{
  NSLog(@"Checking for update... %@", dl);
  return YES;
}

- (void) dataLinkManager: (NSDataLinkManager *)sender startTrackingLink: (NSDataLink *)dl
{
  NSLog(@"Start tracking %@", dl);
}

- (void) dataLinkManager: (NSDataLinkManager *)sender stopTrackingLink: (NSDataLink *)dl
{
  NSLog(@"Stops tracking %@", dl);
}

@end
