trigger CitiesTask on Contact (After insert,after update) {
    
    map<id,account> city = new map<id,account>([select id,AllCities__c from account]);
    list<account> cities = new list<account>();
    string cit = '';
    for(contact con:trigger.new){
        account acc = new account();
        acc = city.get(con.AccountId);
        //acc.AllCities__c = con.Cities__c;
        cit =  con.Cities__c + ',' +acc.AllCities__c;
        cit = cit.remove('null');
        cit = cit.removeEnd(',');
        acc.AllCities__c = cit ;
        cities.add(acc);
    }
    update cities;

}