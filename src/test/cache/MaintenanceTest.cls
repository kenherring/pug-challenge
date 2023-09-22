using OpenEdge.Core.Assert.

block-level on error undo, throw.

class cache.MaintenanceTest use-widget-pool inherits cache.Maintenance:

  @Before.
  method public void beforeMethod () :
    create ttUsers.
    ttUsers.user-name = "KenHerring".
    ttUsers.user-guid = "1234".
    release ttUsers.
  end method.

  @TearDown.
  method public void tearDownMethod () :
    //after each test.
    resetCache().
    
    //CABL warning on the next line for unused variable.
    define variable somevar as character no-undo.
  end method.

  @Test.
  method public static void testGetUserFromGuide () :
    Assert:Equals("KenHerring", GetUserNameFromGUID("1234")).
    //get user list
  end method.

end class.