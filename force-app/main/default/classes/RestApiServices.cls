public class RestApiServices {
    
    private string cKey = '3MVG9YDQS5WtC11pqwERNnZCznRNT7fuCOiJbK7g8KWyPFQqdoh1fjqIdX8IQswhzZN9AqKMSoWTjfze1suu2';
    private string cSecret = '96ED4DDD72772CA7BB1E8C21561D4415C5ADE61B3E10EAF34555B95A0D2A1C62';
    private string uName = 'prasad@spr.com';
    private string passwd = 'yeruvasai159mkZ6CUKSr5oNI2LFlHuzFrm';
   
     public class responseWrapper {
        public string id;
        public string access_token;
        public string instance_url;
    }
    public string getRequestToken() {
        string reqBody = 'grant_type=password&client_id=' + cKey + '&client_secret=' + cSecret + '&username=' + uName + '&password=' + passwd;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqBody);
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse hresp = h.send(req);
        responseWrapper wResp = (responseWrapper) JSON.deserialize(hresp.getBody(), responseWrapper.class);
        system.debug('Instance url' + wResp.instance_url);
        system.debug('session id' + wResp.access_token);
        return wResp.access_token;
    }
    
    @future(callout = true)
    public static void getUpdateRec(set<id> extId){
        for(account acc:[select id,accexid__c from account where id in:extid]){
            wrapperParameter wp = new wrapperParameter();
            wp.externalid = acc.AccExId__c;
            String accToken;
        string responseBody;
        string endPoint = 'https://praasd-dev-ed.my.salesforce.com/services/apexrest/restupdate/';
         RestApiServices rep = new RestApiServices();
           accToken = rep.getRequestToken();
            if(accToken!=''){
                http h = new http();
                httpRequest req = new httpRequest();
                req.setHeader('Authorization', 'Bearer ' + accToken);
                req.setHeader('Content-Type', 'application/json');
                req.setBody(JSON.serialize(wp));
                req.setMethod('PUT');
                req.setEndpoint(endpoint);
                httpResponse res = h.send(req);
                system.debug('hresp1' + res);
            }
        }
    }
    
    public class wrapperParameter{
       public string ExternalId;
      }

}