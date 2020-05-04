public class restListofRecords {
    
    private string cKey = '3MVG9YDQS5WtC11pqwERNnZCznRNT7fuCOiJbK7g8KWyPFQqdoh1fjqIdX8IQswhzZN9AqKMSoWTjfze1suu2';
    private string cSecret = '96ED4DDD72772CA7BB1E8C21561D4415C5ADE61B3E10EAF34555B95A0D2A1C62';
    private string uName = 'prasad@spr.com';
    private string passwd = 'yeruvasai159mkZ6CUKSr5oNI2LFlHuzFrm';
    
    public static list<resultWrapper> listrec {get;set;}
    
    public restListofRecords(){
        listrec = new list<resultWrapper>();
    }
    
    public class responseWrapper {
        public string id;
        public string access_token;
        public string instance_url;
    }
    public string requestToken(){
        
        string reqBody = 'grant_type=password&client_id=' + cKey + '&client_secret=' + cSecret + '&username=' + uName + '&password=' + passwd;
		Http p = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqBody);
        req.setMethod('GET');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse res = p.send(req);
        responseWrapper wResp = (responseWrapper)JSON.deserialize(res.getBody(),responseWrapper.class);
        system.debug('Instance url' + wResp.instance_url);
        system.debug('session id' + wResp.access_token);
        return wResp.access_token;
    }
    
    public void getListofAccount(){
        list<account> acc = new list<account>();
        String accToken;
        string responseBody;
        string endPoint = 'https://praasd-dev-ed.my.salesforce.com/services/apexrest/ListOfRecords/';
        restListofRecords restlist = new restListofRecords();
        accToken = restlist.requestToken();
        system.debug('access token' + accToken);
        if(accToken != ''){
            Http h1  = new Http();
            HttpRequest req = new HttpRequest();
            req.setHeader('Authorization', 'Bearer ' + accToken);
            req.setHeader('Content-Type', 'application/json');
            req.setMethod('GET');
            req.setEndpoint(endpoint);
            HttpResponse res = h1.send(req);
             listrec = (list<resultWrapper>)Json.deserialize(res.getBody(),list<resultWrapper>.class);
            system.debug(listrec);
            
        }
    }
     public class resultWrapper {
        public string id {get;set;}
        public string name {get;set;}
        public string phone {get;set;}
        public string type {get;set;} 
         
    }

}