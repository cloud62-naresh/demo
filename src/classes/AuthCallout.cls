global class AuthCallout {
    webservice static String basicAuthCallout(){
/*        HttpRequest req = new HttpRequest();
        //req.setEndpoint('http://localhost:8080/axis2/services/DataArchService/getContacts?accountID=0015000000aPLQ5AAO');
        req.setEndpoint('http://localhost:8080/DataArchiver/LandingAction');
        req.setMethod('PUT');
        // Specify the required user name and password to access the endpoint
        // As well as the header and header information
        //String username = 'myname';
        //String password = 'mypwd';
        //Blob headerValue = Blob.valueOf(username + ':' + password);
        //String authorizationHeader = 'BASIC ' +
        //EncodingUtil.base64Encode(headerValue);
        //req.setHeader('Authorization', authorizationHeader);
        // Create a new http object to send the request object
        // A response object is generated as a result of the request
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        return res.getBody();
 */
 HttpRequest req = new HttpRequest();
     
    //Set HTTPRequest Method
    req.setMethod('GET');
     
    //Set HTTPRequest header properties
   // req.setHeader('content-type', 'image/gif');
    //req.setHeader('Content-Length','1024');
   // req.setHeader('Host','s3.amazonaws.com');
    req.setHeader('Connection','keep-alive');
    req.setEndpoint( 'http://www.google.com');
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
            return res.getBody();     
     } catch(System.CalloutException e) {
            //Exception handling goes here....
     }
        return '';          
    }


/*    public static String basicAuthCallout(){
HttpRequest req= new HttpRequest(); 
          req.setEndpoint('your endpoint here'); 
          req.setMethod('POST'); 
          req.setHeader('content-type', 'text/xml; charset=utf-8');  
              req.setHeader('SOAPAction', 'http://wcf42.Services/IUploadSvc/Upload'); 
          
          
          //req.setBody(req);
          Http http = new Http();
         // SimpleXMLParser.ReturnObject xmlparserError = new SimpleXMLParser.ReturnObject();
          
          //Send the request, and return a response 
          System.debug('Request sent: ' + req.getBody());
          HttpResponse resObj = new HttpResponse();
          String response = '';
          try{
                // Send the request, and return a response
               resObj = http.send(req); 
               response = resObj.getBody();
               
            }
            catch(Exception ex){
                System.debug(ex.getCause());
                System.debug(ex.getMessage());
                //xmlparserError.ReturnId = '-1';
                //xmlparserError.ErrorMessage = ex.getMessage();
                //return xmlparserError;
            }
           
          if(response.length() == 0){
                return null;
            }
            else {
                System.debug('Response got : ' + resObj.getBody());
                SimpleXMLParser xmlparser = new SimpleXMLParser();
                XmlStreamReader reader = new XmlStreamReader(response);
                return xmlparser.parseReturnObjects(reader); 
            }
      }  */     
    }