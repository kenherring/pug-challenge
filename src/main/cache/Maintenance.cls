
class cache.Maintenance use-widget-pool :

  define private static temp-table ttUsers no-undo
    field user-guid as character
    field user-login as character
    field user-name as character
    field user-first-name as character
    field user-last-name as character
    field user-email as character
    index idx-1 is primary unique user-guid.

  constructor public Maintenance () :
    super().
  end constructor.

  method static public character GetUserNameFromGUID (ipGuid as character) :
    find first ttUsers no-lock where ttUsers.user-guid = ipGuid no-error.
    if not available ttUsers then
    do:
      create ttUsers.
      assign ttUsers.user-guid = ipGuid.
    end.
    return ttUsers.user-name.
  end method.

  method static public character GetUserLoginFromGUID (ipGuid as character) :
    find first ttUsers no-lock where ttUsers.user-guid = ipGuid no-error.
    if not available ttUsers then
    do:
      create ttUsers.
      assign ttUsers.user-guid = ipGuid.
    end.
    return ttUsers.user-name.
  end method.

  method static protected void resetCache () :
    //for unit testing
    empty temp-table ttUsers.
  end method.

end class.
