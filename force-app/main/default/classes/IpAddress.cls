public class IpAddress {
    
    public String country {get;set;}    
    public String ip {get;set;}
    public Decimal latitude {get;set;}
    public Decimal longitude {get;set;}
    public String countrycode{get;set;}
    public string returnvalue {get;set;}
    public string city {get;set;}
    public string region {get;set;}
    
    public  void getRequest(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://api.ipstack.com/'+ReturnValue+'?access_key=d7301fde48eaa15b2abc55d5f51abfe3');
        req.setMethod('GET');
        HttpResponse res;
        res = h.send(req);
        System.debug('Result'+res.getbody());
        string jsonString = res.getBody();
        Map<string,object>m = (Map<string,object>)JSON.deserializeUntyped(res.getbody());
        system.debug(m);
        country =(String)m.get('country_name');    
        countrycode=(String)m.get('country_code');       
        ip=(String)m.get('ip');
        latitude=(Decimal)m.get('latitude');
        longitude =(Decimal)m.get('longitude');
        city = (string)m.get('city');
        region = (string)m.get('region_name');
    }
    
    

}