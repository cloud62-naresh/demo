public class SendEmailExample{
    
    public static void sendEmailUsingOutBound(String caseId){
        String caseNumber = [select caseNumber from Case where Id= :caseId].caseNumber;
        // Create a new single email message object
        // that will send out a single email to the addresses in the To, CC & BCC list.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // Strings to hold the email addresses to which you are sending the email.
        String[] toAddresses = new String[] {'nareshgoyal82@gmail.com'};
        String[] ccAddresses = new String[] {'manish_perfect@yahoo.com'};
        // Assign the addresses for the To and CC lists to the mail object.
        mail.setToAddresses(toAddresses);
        mail.setCcAddresses(ccAddresses);
        // Specify the address used when the recipients reply to the email.
        mail.setReplyTo('manish_perfect@yahoo.com');
        // Specify the name used as the display name.
        mail.setSenderDisplayName('Naresh Goyal Inbound/OutBound Testing');
        // Specify the subject line for your email address.
        mail.setSubject('New Case Created : ' + caseNumber);
        // Set to True if you want to BCC yourself on the email.
        mail.setBccSender(false);
        // Optionally append the salesforce.com email signature to the email.
        // The email address of the user executing the Apex Code will be used.
        mail.setUseSignature(false);
        // Specify the text content of the email.
        mail.setPlainTextBody('Your Case: ' + caseNumber +' has been created');
        mail.setHtmlBody('Your case:<b> ' + caseNumber +' </b>has been created<p>'+
        ' View case <a href=https://na1.salesforce.com/'+caseId+'>click here</a>');
        // Send the email you have created.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
    
    public static void showCustomSettingCountryCode(){
    Map<String, ISOCode__c> mcs = ISOCode__c.getAll();
    Set<String> mapKeySet = mcs.keySet();
    for(String s:mapKeySet){
       system.debug('Country Name::'+mcs.get(s).Country_Name__c+' Country ISO Code::'+mcs.get(s).Country_ISO_Code__c);
     }
    }
 }