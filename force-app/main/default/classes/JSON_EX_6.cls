public class JSON_EX_6 {
    
    public string jsonstring {set;get;}
    public list<integer> ages {set;get;}
    public account acc {set;get;}
    public string jsons {set;get;}
    public string jsons1 {set;get;}
    public string[] city {set;get;}
    
    public JSON_EX_6(){
        ages = new list<integer>();
        jsonstring = '{"Name":"Sai","Salary":10000,"age":30,"marks":[10,20,30]}';
        system.JSONParser jp= JSON.createParser(jsonstring);
        while(jp.nextToken()!=null){
            if(jp.getCurrentToken() == system.JSONToken.VALUE_NUMBER_INT ){
                integer a = (integer)jp.getIntegerValue();
                ages.add(a);
            }
        }
        
        jsons = '{"Name" : "Kiran","age":"30","acc":{"Name":"wipro","industry":"Banking","phone":"45210"}}';
        system.JSONParser jps = JSON.createParser(jsons);
        while(jps.nextToken()!=null){
            if(jps.getText() == 'acc'){
                jps.nextToken();
                 acc = (account)jps.readValueAs(account.class);
            }
        }
        
        jsons1 = '{"Name" : "murari","age":"30","cities":["hyd","ban","che"]}';
        system.JSONParser jpo = JSON.createParser(jsons1);
        while(jpo.nextToken()!=null){
            if(jpo.getText() == 'cities'){
                jpo.nextToken();
                city = (list<string>)jpo.readValueAs(list<string>.class);
            }
        }
    }

}