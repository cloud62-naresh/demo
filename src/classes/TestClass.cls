public class TestClass{
    
    public static void addContact(){
        List<Contact> conList = new List<Contact>();
        for(Integer count=0; count<100; count++){
            Contact c = new Contact();
            c.FirstName = 'Bulk';
            c.LastName = 'Testing';
            conList.add(c);
        }
        insert conList;
    }
    
    //@future
    public static void getContact1(){
        Integer count =0;
        for(List<Contact> con: [select id from Contact Limit 10000]){
            for(Contact c: con){
                count++;
            }
        }
        system.debug('<<<<<<'+count);
        //return count;
    }
}