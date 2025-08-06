/* AppDelegate.m created by heron on Mon 04-Aug-2025 */

#import "AppDelegate.h"

@implementation AppDelegate

- (void) awakeFromNib
{
}

- (void) applicationDidFinishLaunching: (NSNotification *)n
{
  NSSelection *selection = [NSSelection allSelection];
  NSDataLink *dl = [[NSDataLink alloc] initLinkedToFile: @"/tmp/temp.txt"];

  _datalinkManager = [[NSDataLinkManager alloc] initWithDelegate: self];
  [_datalinkManager addLink: dl at: selection];

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

- (void) dataLinkManagerCloseDocument: (NSDataLinkManager *)sender
{
  NSLog(@"Close document %@", sender);
}

- (void) dataLinkManagerDidEditLinks: (NSDataLinkManager *)sender
{
  NSLog(@"Did edit links %@", sender);
}

- (void) dataLinkManagerRedrawLinkOutlines: (NSDataLinkManager *)sender
{
  NSLog(@"Redraw link outlines %@", sender);
}

- (BOOL) dataLinkManagerTracksLinksIndividually: (NSDataLinkManager *)sender
{
  NSLog(@"Tracks links individually %@", sender);
  return YES;
}

- (BOOL) importFile: (NSString *)filename at: (NSSelection *)selection
{
  NSLog(@"Filename %@, selection %@", filename, selection);
  return YES;
}

@end
