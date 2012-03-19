trigger updateWebSite on Account (before insert, before update, before delete, after insert, after update, after delete) {
for(Account a: Trigger.new){
updateWebSite obj = new updateWebSite();
obj.updatWebsiteMethod(a);
}

}