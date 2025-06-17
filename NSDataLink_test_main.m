#include <Foundation/Foundation.h>
#include <AppKit/NSDataLink.h>
#include <AppKit/NSDataLinkManager.h>
#include <AppKit/NSSelection.h>

@interface MockSelection : NSSelection
@end

@implementation MockSelection
@end

@interface MockManager : NSDataLinkManager
@end

@implementation MockManager
@end

static void
test_basic_link (void)
{
  MockSelection *mock_selection;
  MockManager *mock_manager;
  NSArray *mock_types;
  NSDataLink *link;

  mock_selection = [[MockSelection alloc] init];
  mock_manager = [[MockManager alloc] initWithDelegate: nil];
  mock_types = [NSArray arrayWithObjects: @"public.text", @"public.rtf", nil];

  link = [[NSDataLink alloc] initLinkedToSourceSelection: mock_selection
                                               managedBy: mock_manager
                                         supportingTypes: mock_types];

  assert ([link sourceSelection] == mock_selection);
  assert ([link manager] == mock_manager);
  assert ([[link types] isEqualToArray: mock_types]);

  [link setUpdateMode: NSUpdateWhenSourceSaved];
  assert ([link updateMode] == NSUpdateWhenSourceSaved);
  [link noteSourceEdited];
}

static void
test_link_metadata (void)
{
  NSDataLink *link;
  NSString *filename = @"/tmp/test_link_file.link";
  BOOL success;

  link = [[NSDataLink alloc] initLinkedToFile: filename];
  assert (link != nil);

  success = [link writeToFile: filename];
  assert (success);

  NSDataLink *loaded_link = [[NSDataLink alloc] initWithContentsOfFile: filename];
  assert (loaded_link != nil);
}

static void
test_link_break (void)
{
  MockSelection *mock_selection;
  MockManager *mock_manager;
  NSArray *mock_types;
  NSDataLink *link;

  mock_selection = [[MockSelection alloc] init];
  mock_manager = [[MockManager alloc] initWithDelegate: nil];
  mock_types = [NSArray arrayWithObjects: @"public.text", @"public.rtf", nil];

  link = [[NSDataLink alloc] initLinkedToSourceSelection: mock_selection
                                               managedBy: mock_manager
                                         supportingTypes: mock_types];

  BOOL broken = [link break];
  assert (broken);
}

int
main (int argc, const char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  test_basic_link ();
  test_link_metadata ();
  test_link_break ();

  NSLog (@"All tests passed.");

  [pool release];
  return 0;
}
