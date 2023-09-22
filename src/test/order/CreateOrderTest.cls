using OpenEdge.Core.Assert.

class order.CreateOrderTest use-widget-pool :

  define private property CO as order.CreateOrder no-undo get. set.

  constructor CreateOrderTest () :
    super().
    CO = new order.CreateOrder().
  end constructor.

  @Setup.
  method public void setupMethod () :
    for each Order exclusive-lock:
      delete Order.
    end.
  end method.

  @Test.
  method public void testMethod () :
    define variable oNum as integer no-undo.
    oNum = CO:CreateHeader(1).
    CO:AddOrderLine(oNum, 1, 1).

    // Assert:equals(1,oNum).
  end method.

end class.