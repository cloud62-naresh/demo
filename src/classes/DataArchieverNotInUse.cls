public class DataArchieverNotInUse {
    public String searchOperator;
    
  public void setSearchOperator(String searchOper){
        this.searchOperator= searchOper;
    }

    public String getSearchOperator(){
        return this.searchOperator;
    }
    

    
    public DataArchieverNotInUse (ApexPages.StandardController controller) {
    }
    
    
    public void lineDataMatching(){
    
     HttpRequest req = new HttpRequest();
     
    //Set HTTPRequest Method
    req.setMethod('GET');
     
    //Set HTTPRequest header properties
   // req.setHeader('content-type', 'image/gif');
    //req.setHeader('Content-Length','1024');
   // req.setHeader('Host','s3.amazonaws.com');
    req.setHeader('Connection','keep-alive');
    req.setEndpoint( 'http://localhost:8080');
    //req.setEndpoint( 'https://localhost:8080/axis2/services/DataArchService.DataArchServiceHttpSoap11Endpoint/');
    //req.setHeader('Date',getDateString());
     
    //Set the HTTPRequest body 
    //req.setBody(body); 
     
Http http = new Http();
     
     try {
       
          //Execute web service call here      
          HTTPResponse res = http.send(req);   
     
          //Helpful debug messages
          System.debug(res.toString());
          System.debug('STATUS:'+res.getStatus());
          System.debug('STATUS_CODE:'+res.getStatusCode());
           //setSearchOperator(res.getBody());  
    
    }catch(System.CalloutException e) {
            //Exception handling goes here....
     }
       //return '';          
    }
    
    

    public void lineDataMatching123(){
        HttpRequest req = new HttpRequest();
     
    //Set HTTPRequest Method
    req.setMethod('POST');
     
    //Set HTTPRequest header properties
   req.setHeader('Content-Type', 'text/xml');
    //req.setHeader('Content-Length','1024');
   // req.setHeader('Host','s3.amazonaws.com');
    //req.setHeader('Connection','keep-alive');
    
    req.setEndpoint( 'http://www.yahoo.com');
    //req.setHeader('Date',getDateString());
     
    //Set the HTTPRequest body 
    //req.setBody(body); 
    req.setTimeout(60000);

 //req.setEndpoint( 'http://localhost:8080/axis2/services/DataArchService/getContacts?accountID=0015000000aPLQ5AAO');    
Http http = new Http();
     
     try {
       
          //Execute web service call here      
          HTTPResponse res = http.send(req);   
     
          //Helpful debug messages
          System.debug(res.toString());
          System.debug('STATUS:'+res.getStatus());
          System.debug('STATUS_CODE:'+res.getStatusCode());
            //setSearchOperator(res.getBody());       
    }catch(Exception e){
    //setSearchOperator('No data with exception' +e.getMessage());
    }
    // setSearchOperator('No data' );
  }
  }