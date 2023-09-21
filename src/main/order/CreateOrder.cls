

class order.CreateOrder use-widget-pool :

  method public integer CreateHeader (vCustNum as integer) :
    define variable ordNum as integer no-undo.

    create Order.
    Order.CustNum = vCustNum.
    Order.OrderDate = today.
    log-manager:write-message("created ordernum:" + string(Order.OrderNum)).
    ordNum = Order.OrderNum.
    release Order.

    return ordNum.
  end method.

  method public void AddOrderLine (vOrderNum as integer, vItemNum as integer, vQty as integer) :
    create OrderLine.
    OrderLine.OrderNum = vOrderNum.
    OrderLine.ItemNum = vItemNum.
    OrderLine.Qty = vQty.
    log-manager:write-message("added orderline:" + string(OrderLine.OrderNum) + " " + string(OrderLine.LineNum)).
    release OrderLine.
  end method.

end class.