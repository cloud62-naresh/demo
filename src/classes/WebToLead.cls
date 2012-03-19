public class WebToLead{
    public WebToLead(ApexPages.StandardController controller) {

    }


private String companyId;
private String retURL;
private String firstName;
private String lastName;
private String email;
private String company;
private String city;
private String state;

private Lead l;

public WebToLead(){
setCompanyId('00D80000000MML0');
setRetURL('http://login.salesforce.com');
}

public void setCompanyId(String cId){
    this.companyId = cId;
}
public String getCompanyId(){
    return this.companyId;
}

public void setRetURL(String retUr){
    this.retURL = retUr;
}

public String getRetURL(){
    return this.retURL;
}

public void setFirstName(String fName){
this.firstName = fName;
}

public String getFirstName(){
return this.firstName;
}

public void setLastName(String lName){
this.lastName = lName;
}

public String getLastName(){
return this.lastName;
}

public void setEmail(String email){
this.email = email;
}

public String getEmail(){
return this.email;
}

public void setCompany(String comp){
this.company = comp;
}

public String getCompany(){
return this.company;
}
public void setCity(String city){
this.city = city;
}

public String getCity(){
return this.city;
}
public void setState(String state){
this.state = state;
}

public String getState(){
return this.state;
}

public PageReference submit(){
l = new Lead();
l.FirstName = firstName;
l.LastName = lastName;
l.Company = company;
l.City = city;
l.State = state;
l.Email = email;
 insert l;
//return null;
return new PageReference('/apex/ThankYou');
}

}