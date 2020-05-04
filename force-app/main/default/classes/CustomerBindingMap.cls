public class CustomerBindingMap {
     public Map<string, list<customer__c>> customer {get; set;}
    public List<selectoption> keys {get; set;}
    public String selectedKey {get; set;}
   
     
    public Set<string> getMapKeys()
    {
        return customer.keySet();
    }
     
    public CustomerBindingMap()
    {
      //  accsByName=new Map<string, account>();
        List<string> sortedKeys=new List<string>();
        customer=new Map<string, list<customer__c>>();
        customer.put('All', new List<customer__c>());
        List<customer__c> accs=[select id, Name,email__c
                            from customer__c
                            order by Name asc];
                             
                             
        for (customer__c acc : accs)
        {
            customer.get('All').add(acc);
            String start=acc.Name.substring(0,1);
            List<customer__c> accsFromMap=customer.get(start);
            if (accsFromMap==null)
            {
                accsFromMap=new List<customer__c>();
                customer.put(start, accsFromMap);
            }
            accsFromMap.add(acc);
            //accsByName.put(acc.name, acc);
        }
         
        keys=new List<selectoption>();
        for (String key : customer.keySet())
        {
            if (key != 'All')
            {
                sortedKeys.add(key);
            }
        }
        sortedKeys.sort();
        sortedKeys.add(0, 'All');
         
        for (String key : sortedKeys)
        {
            
            keys.add(new SelectOption(key, key));
        }
         
        selectedKey='All';
    }

}