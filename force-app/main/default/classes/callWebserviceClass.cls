public class callWebserviceClass {
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
    public static void getConList(Set < id > accIdSet) {
        String accToken;
        string responseBody;
        string endPoint = 'https://praasd-dev-ed.my.salesforce.com/services/apexrest/createAccountRecord';
        callWebserviceClass obj = new callWebserviceClass();
        accToken = obj.getRequestToken();
        system.debug('access token' + accToken);
        if (accToken != '') {
            for (Account acc: [SELECT id,name,accexid__c from account where id in: accIdSet]) {
                system.debug('JSON' + JSON.serialize(acc));
                Http h1 = new Http();
                HttpRequest req1 = new HttpRequest();
                req1.setHeader('Authorization', 'Bearer ' + accToken);
                req1.setHeader('Content-Type', 'application/json');
                req1.setMethod('POST');
                req1.setBody(JSON.serialize(acc));
                req1.setEndpoint(endPoint);
                HttpResponse hresp1 = h1.send(req1);
                system.debug('hresp1' + hresp1);
            }
        }
    }
}