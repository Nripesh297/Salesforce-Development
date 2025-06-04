public class CaseHandlerController {
    
    
    public static void beforeInsert(List<Case> newCases) {
        
        SET<String> webPhoneSet = new SET<String>();
        for(Case cs: newCases){
            if(String.isNotBlank(cs.SuppliedPhone)){
                webPhoneSet.add(cs.SuppliedPhone);
            }
        }
        
        
        Map<String, Id> phoneToAccountMap = new Map<String, Id>();
        for(Account acc: [SELECT Id, Name, Phone FROM Account WHERE Phone IN:webPhoneSet]){
            phoneToAccountMap.put(acc.Phone, acc.Id);
        }
        
        for(Case cs: newCases){
            if(String.isNotBlank(cs.SuppliedPhone) && phoneToAccountMap.containsKey(cs.SuppliedPhone)){
                     cs.AccountId = phoneToAccountMap.get(cs.SuppliedPhone);                
                }

        }
    }
}