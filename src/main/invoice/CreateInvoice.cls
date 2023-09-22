
using invoice.* from propath.
class invoice.CreateInvoice use-widget-pool :

  method public logical new (vCustNum as integer,
                             vAmount as decimal) :
    create Invoice.
    Invoice.CustNum = vCustNum.
    Invoice.Amount = vAmount.
    Invoice.Adjustment = vAmount.
    Invoice.InvoiceDate = today.
    Invoice.InvoiceNum = next-value(NextInvNum).
    release Invoice.
    return true.
  end method.

  method public logical delete (vInvoiceNum as integer) :
    find first Invoice where Invoice.InvoiceNum = vInvoiceNum exclusive-lock no-error.
    if available Invoice then
    do:
      delete Invoice.
      return true.
    end.
    return false.
  end method.

  //this method updates an invoice with a new amount
  method public logical update (vInvoiceNum as integer,
                                vAmount as decimal) :
    find first Invoice where Invoice.InvoiceNum = vInvoiceNum exclusive-lock no-error.
    if available Invoice then
    do:
      Invoice.Amount = vAmount.
      Invoice.Adjustment = vAmount.
      release Invoice.
      return true.
    end.
    return false.
  end method.

  //this method returns the invoice amount
  method public decimal getAmount (vInvoiceNum as integer) :
    find first Invoice where Invoice.InvoiceNum = vInvoiceNum exclusive-lock no-error.
    if available Invoice then
    do:
      return Invoice.Amount.
    end.
    return 0.
  end method.
  

end class.