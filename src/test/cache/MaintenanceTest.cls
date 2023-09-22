using OpenEdge.Core.Assert.

class cache.MaintenanceTest use-widget-pool inherits cache.Maintenance:

  {cache/cache.i}

  @TearDown.
  method public void tearDownMethod () :
    //after each test.
    resetCache().
    
    //CABL warning on the next line for unused variable.
    define variable somevar as character no-undo.

    create ttCache.
    ttCache.cacheid = 1.
    release ttCache.
  end method.

  @Test.
  method public static void testGetUserFromGuide () :
    Assert:Equals("KenHerring", GetUserNameFromGUID("1234")).
    //get user list
  end method.

end class.