global class TestScheduledApexFromTestMethod implements Schedulable {
// Run the scheduled job at midnight Sept. 3rd. 2022
public static String CRON_EXP = '0 0 0 3 9 ? 2022';
global void execute(SchedulableContext ctx) {
CronTrigger ct = [SELECT id, CronExpression, TimesTriggered, NextFireTime FROM
CronTrigger WHERE id = :ctx.getTriggerId()];
System.assertEquals(CRON_EXP, ct.CronExpression);
System.assertEquals(0, ct.TimesTriggered);
System.assertEquals('2022-09-03 00:00:00', String.valueOf(ct.NextFireTime));
Account a = [SELECT id, name FROM Account WHERE name = 'testScheduledApexFromTestMethod'];
a.name = 'testScheduledApexFromTestMethodUpdated';
update a;
}}