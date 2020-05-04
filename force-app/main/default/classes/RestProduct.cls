public class RestProduct {
    
    private string cKey ='3MVG9G9pzCUSkzZsvjnc3WPEIO8qo3dHP0XFW8ho5jyVPQIsv2IsYcYa3j1CcrmzQl8a_HNojI3tx_HZ9DHMW';
    private string cSecret ='39130738615FF4C59DAB65FD389256208BB85939FBD4F7DD81825B509781E17F';
    private string uName = 'warehouseproject@project.com';
    private string passwd = 'yeruvasai2VzSddnhpAYAYJF6w7YYte2tRR';
    
     public static list <Wrapper> Wrap {get;set;}
    
    public RestProduct(){
        wrap = new list<wrapper>();
    }
    
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
        system.debug(hresp);
        responseWrapper wResp = (responseWrapper) JSON.deserialize(hresp.getBody(), responseWrapper.class);
        system.debug(wresp.access_token);
        system.debug('Instance url' + wResp.instance_url);
        system.debug('session id' + wResp.access_token);
        return wResp.access_token;
    }
    
    
    public static void getConList() {
        String accToken;
        string responseBody;
        string endPoint = 'https://sp-warehouse-dev-ed.my.salesforce.com/services/apexrest/createproduct';
        RestProduct obj = new RestProduct();
        accToken = obj.getRequestToken();
        system.debug(acctoken);
        system.debug('access token' + accToken);
        if (accToken != '') {
               // system.debug('JSON' + JSON.serialize(acc));
                Http h1 = new Http();
                HttpRequest req1 = new HttpRequest();
                req1.setHeader('Authorization', 'Bearer ' + accToken);
                req1.setHeader('Content-Type', 'application/json');
                req1.setMethod('GET');
                //req1.setBody(JSON.serialize(acc));
                req1.setEndpoint(endPoint);
                HttpResponse hresp1 = h1.send(req1);
            	system.debug(hresp1.getBody());
            	wrap =(list<wrapper>)JSON.deserializeUntyped(hresp1.getBody());
            
            }
        
    }
    public class wrapper{
        public string name{get;set;}
        public decimal item{get;set;}
        public string unit{get;set;}
        public decimal stock{get;set;}
    }

}