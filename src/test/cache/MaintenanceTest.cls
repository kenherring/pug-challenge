using OpenEdge.Core.Assert.

class cache.MaintenanceTest use-widget-pool inherits cache.Maintenance:

  @TearDown.
  method public void tearDownMethod () :
    //after each test.
    resetCache().
  end method.

  @Test.
  method public static void testGetUserFromGuide () :
    Assert:Equals("KenHerring", GetUserNameFromGUID("1234")).
    //get user list
  end method.

end class.