public class Rest_CreateRecord {
    
    public string username = 'prasad@spr.com';
    public string password = 'yeruvasai159mkZ6CUKSr5oNI2LFlHuzFrm';
    public string clientid = '3MVG9YDQS5WtC11pqwERNnZCznRNT7fuCOiJbK7g8KWyPFQqdoh1fjqIdX8IQswhzZN9AqKMSoWTjfze1suu2';
    public string clientsecret = '96ED4DDD72772CA7BB1E8C21561D4415C5ADE61B3E10EAF34555B95A0D2A1C62';
    public string endpoint = 'https://login.salesforce.com/services/oauth2/token';
    public string result       {set;get;}
    public static list<resultwrapper>listwrap {set;get;}
    
    public Rest_CreateRecord(){
        listwrap = new list<resultwrapper>();
    }
    public class responseWrapper{

    public string id;
	public string access_token;
	public string instance_url;

	}
    
    
    
    public string getToken(){
               
        http p = new http();
        httpRequest req = new httpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        string body ='grant_type=password';
        body = body+'&client_id='+clientid;
        body = body+'&client_secret='+clientsecret;
        body = body+'&username='+username;
        body = body+'&password='+password;
        req.setBody(body);
        httpResponse res = p.send(req);
        responseWrapper wResp=(responseWrapper) JSON.deserialize(res.getBody(),responseWrapper.class);
        system.debug('Instance url'+wResp.instance_url);
		system.debug('session id'+wResp.access_token);
		return wResp.access_token;
        
            }
    
    public void getconlist(){
        list<account> acc = new list<account>();
        String accToken;
		string responseBody;
        string endPoint='https://praasd-dev-ed.my.salesforce.com/services/apexrest/getCreateAccount';
        Rest_CreateRecord obj=new Rest_CreateRecord();
        accToken = obj.getToken();
        system.debug('access token'+ accToken);
        if(accToken!='')
        {
        string Jsonstring='{"Name":"Acc testname 1"}';
        Http h1=new Http();
        HttpRequest req1=new HttpRequest();
        req1.setHeader('Authorization','Bearer '+accToken);
        req1.setHeader('Content-Type','application/json');
        //req1.setHeader('accept','application/json');
        req1.setMethod('POST');
        req1.setBody(Jsonstring);
        req1.setEndpoint(endPoint);
        HttpResponse hresp1=h1.send(req1);
        system.debug('hresp1'+ hresp1);
    }
}
    public class resultWrapper{

    public string id{get;set;}
    public string name{get;set;}
    
    
    }
}