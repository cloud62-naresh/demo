trigger CheckAccountName on Account (before insert){

    for (Account a : Trigger.New){
    
        if (a.Name == 'Bad Name'){
            a.addError ('You have entered an incorrect name.  Please try again');
        }
    
    }

}