public class InvoiceServiceAccountExtension {
     
      private final String serviceEndpoint = 'http://localhost:8080/DataArchiver/DataArchiverServiceHandler/1.0';
//'https://sfdctst.brocade.com:8282/orabpel/cdh/CdhCustomerCreateProvider/1.0';
       private final String certName = null;
     
      private final Account acct;
     
      public class Invoice {
        public Integer invoiceNumber {get;set;}
        public Integer orderNumber {get;set;}
        public Integer contractNumber {get;set;}
        public Date dueDate {get;set;}
        public Double amount {get;set;}
        public String status {get;set;}
      
        public void from_xml(dom.XmlNode node) {
          invoiceNumber = Integer.valueOf(node.getChildElement('invoice-number',null).getText());
          orderNumber = Integer.valueOf(node.getChildElement('order-number',null).getText());
          contractNumber = Integer.valueOf(node.getChildElement('contract-number',null).getText());
          dueDate = Date.parse(node.getChildElement('due-date',null).getText());
          amount = Double.valueOf(node.getChildElement('amount',null).getText());
          status = node.getChildElement('status',null).getText();
        }
      }
      
      public List<Invoice> invoices {
        get {
          if(invoices==null) {
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setTimeout(2000);
           // req.setEndpoint(serviceEndpoint+'?id='+acct.id);
            req.setEndpoint(serviceEndpoint);
            req.setMethod('GET');
            if(certName!=null) {
              req.setClientCertificateName(certName);
            }
            
            
            cloud62Com.DataArchiverServiceHttpSoap11Endpoint ds = new cloud62Com.DataArchiverServiceHttpSoap11Endpoint();
            sobjectEnterpriseSoapSforceComXsd.Contact[] rs = ds.getContacts('0015000000FWE78AAH');
            system.debug('my new result is '+rs.size());
            
            
         req.setHeader('content-type', 'text/xml');
  //req.setHeader('Content-Length','1024');
//req.setHeader('Status-Length','1024');

  //req.setHeader('Host','http://172.16.59.235:8080');
  req.setHeader('Accept', 'application/atom+xml;charset=utf-8');

  req.setHeader('Connection','keep-alive');  
  system.debug('printting URL '+req.toString()); 
            HttpResponse res = h.send(req);
      
            if(res.getStatusCode()>299) {
              System.debug('ERROR: '+res.getStatusCode()+': '+res.getStatus());
              System.debug(res.getBody());
            } else {
              dom.Document doc = res.getBodyDocument();
              invoices = new List<Invoice>();
              for(dom.XmlNode node : doc.getRootElement().getChildElements()) {
                if(node.getName()=='invoice') {
                  Invoice iv = new Invoice();
                  iv.from_xml(node);
                  invoices.add(iv);
                }
              }
            }
          }
          return invoices;
        }
        set;
      }
      
      public InvoiceServiceAccountExtension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
      }
    }