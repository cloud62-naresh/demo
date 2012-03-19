global class CreateTaskEmailExample implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope env){

        // Create an inboundEmailResult object for returning the result of the Apex Email Service
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String myPlainText= '';
        // Add the email plain text into the local variable
        myPlainText = email.plainTextBody;
        // New Case object to be created
        Case[] newCase = new Case[0];
        // Try to lookup any contacts based on the email from address
        // If there is more than 1 contact with the same email address,
        // an exception will be thrown and the catch statement will be called.
        try {
        Contact vCon = [Select Id, Name, Email  From Contact Where Email = :email.fromAddress Limit 1];
        // Add a new Case to the contact record we just found above.
        newCase.add(new Case(Description = myPlainText, 
        Priority = 'Normal',
        Status = 'Inbound Email',
        Subject = email.subject,
        //IsReminderSet = true,
        //ReminderDateTime = System.now()+1,
        ContactId = vCon.Id));

        // Insert the new Case
        insert newCase;
        System.debug('New Case Object: ' + newCase );
        SendEmailExample.sendEmailUsingOutBound(newCase[0].ID);
        }
        // If an exception occurs when the query accesses
        // the contact record, a QueryException is called.
        // The exception is written to the Apex debug log.
        catch (QueryException e) {
        System.debug('Query Issue: ' + e);
        }
        // Set the result to true. No need to send an email back to the user
        // with an error message
        result.success = true;
        // Return the result for the Apex Email Service
        return result;
    }
}