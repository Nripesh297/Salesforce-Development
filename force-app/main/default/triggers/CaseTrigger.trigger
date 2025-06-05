/*

Create a Salesforce trigger that automatically searches for a Account based on the Phone field of a Case when the case is created,
and then populated the Account field on the Case object with the matching Account.

Solution:  1: We will write trigger on Case Object.(Whenever case is created)
           2: We will use Before trigger because we are going to populate Account field on case object during creation of case record based on phone field matching with Account
           2: Trigger Event : before Insert
           3: Context Variable: trigger.new ( Whenever case is created means newly case 

*/

trigger CaseTrigger on Case (before insert) { 

   if(trigger.isBefore){
      if(trigger.isInsert){
         CaseHandlerController.beforeInsert(trigger.new);
      }
   }

}