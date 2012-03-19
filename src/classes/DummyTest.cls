@isTest
private class DummyTest {

    static testMethod void myUnitTest() {
        Account a = new Account();
        a.Name = 'Bad Name';
        try{        
        insert a;  //this will throw an error
        
}catch(Exception e){

}
    }
    
}