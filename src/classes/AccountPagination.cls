public with sharing class AccountPagination {
private final Account acct;
// The constructor passes in the standard controller defined below
// in the Visualforce markup
public AccountPagination(ApexPages.StandardSetController controller) {
controller.setPageSize(10);
this.acct = (Account)controller.getRecord();

}
public ApexPages.StandardSetController accountRecords{
get {
if(accountRecords == null) {
return new ApexPages.StandardSetController(Database.getQueryLocator(
[SELECT name FROM Account WHERE Id NOT IN (SELECT AccountId
FROM Opportunity WHERE IsClosed = false)]));
}
return accountRecords;
}
private set;
}
public List<Account> getAccountPagination() {
return (List<Account>) accountRecords.getRecords();
}
}