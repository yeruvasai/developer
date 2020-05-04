public with sharing class DynamicTesting {

    public map<string, list<account>> accmap{set;get;}
public list<selectoption> keys{set;get;}
public string selectedkey{set;get;}

        public DynamicTesting ()
        {
        accmap=new map<string, list<account>>();
        list<account> accs=new list<account>();
        list<account> AL;
        accs=[select id,name from account];
        accmap.put('All', accs);
                for(Account acc:accs)
                {
                string start=acc.name.substring(0,1);
                AL=new list<account>();
                AL.add(acc);
                accmap.put(start, AL);
                }
        list<string> sortedkeys=new list<string>();
        sortedkeys.add('All');
        keys=new list<selectoption>();
        for(string key:accmap.keyset())
        {
            if(key!='All')
            {
            sortedkeys.add(key);
            }
        }
        for(string key:sortedkeys)
        {
        keys.add(new selectoption(key, key));
        }
        selectedkey='All';

        }
}