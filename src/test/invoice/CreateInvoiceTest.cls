
using OpenEdge.Core.Assert.

class invoice.CreateInvoiceTest use-widget-pool :
  
  define private property CI as invoice.CreateInvoice get. set.

  constructor CreateInvoiceTest () :
    CI = new invoice.CreateInvoice().
  end constructor.


  @Before.
  method public void beforeMethod () :
    disable triggers for load of Invoice.
    for each Invoice exclusive-lock:
      delete Invoice.
    end.
  end method.

  @TearDown.
  method public void tearDownMethod () :
    for each Invoice exclusive-lock:
      delete Invoice.
    end.
  end method.

  @Test.
  method public void testMethod () :
    define variable invCount as integer no-undo.
    CI:new(1,1.0).
    CI:new(2,1.1).

    for each Invoice no-lock where Invoice.CustNum = 1:
      invCount = invCount + 1.
    end.
    Assert:equals(1, invCount).
  end method.

end class.
