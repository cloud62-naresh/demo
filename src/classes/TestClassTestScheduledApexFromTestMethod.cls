@istest
class TestClassTestScheduledApexFromTestMethod {
static testmethod void test() {
Test.startTest();
Account a = new Account();
a.name = 'testScheduledApexFromTestMethod';
insert a;

// Schedule the test job
String jobId = System.schedule('testBasicScheduledApex', TestScheduledApexFromTestMethod.CRON_EXP, new TestScheduledApexFromTestMethod());

// Get the information from the CronTrigger API object
CronTrigger ct = [SELECT id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
// Verify the expressions are the same
System.assertEquals(TestScheduledApexFromTestMethod.CRON_EXP, ct.CronExpression);
// Verify the job has not run
System.assertEquals(0, ct.TimesTriggered);
// Verify the next time the job will run
System.assertEquals('2022-09-03 00:00:00', String.valueOf(ct.NextFireTime));
System.assertNotEquals('testScheduledApexFromTestMethodUpdated',
[SELECT id, name FROM account WHERE id = :a.id].name);
Test.stopTest();
System.assertEquals('testScheduledApexFromTestMethodUpdated',
[SELECT id, name FROM account WHERE id = :a.id].name);
}

}