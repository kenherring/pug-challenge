
using invoice.* from propath.
class invoice.CreateInvoice use-widget-pool :

  method public logical new (vCustNum as integer,
                             vAmount as decimal) :
    create Invoice.
    Invoice.CustNum = vCustNum.
    Invoice.Amount = vAmount.
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

end class.