public class WeboAuth {
    
    public string clientid {set;get;}
    public string clientsecret {set;get;}
    public string callback {set;get;}
    public string state {set;get;}
    public string code {set;get;}
    public string accesstoken {set;get;}
    public string result {set;get;}
    public WeboAuth (){
        
        callback = 'https://yvsp-dev-ed.my.salesforce.com/apex/WebserveroAuth';
    }
    
    public pagereference getcode(){
        
        string url = 'https://www.linkedin.com/oauth/v2/authorization?';
        url = url+'response_type=code';
        url = url+'&client_id='+clientid;
        url = url+'&redirect_uri='+callback;
        url = url+'&scope='+state;
        pagereference p = new pagereference(url);
        return p;
        
        
    }
    public void code(){
        code = apexpages.currentPage().getparameters().get('code');
            }
    
    public void gettoken(){
        string url = 'https://www.linkedin.com/oauth/v2/accessToken';
        string body = 'grant_type=authorization_code';
        body = body+'&code='+code;
        body = body+'&redirect_uri='+callback;
        body = body+'&client_id='+clientid;
        body = body+'&client_secret='+clientsecret;
        system.debug(body);
        http p =new http();
        httprequest req = new httprequest();
        req.setEndpoint(url);
        req.setMethod('POST');
        req.setbody(body);
        httpresponse res = new httpresponse();
        res = p.send(req);
        string jsonstring = res.getBody();
        system.debug(jsonstring);
        system.JSONParser jp = JSON.createParser(jsonString);
        while(jp.nextToken()!=null){
            if(jp.getText() == 'access_token'){
                jp.nextToken();
                accesstoken = jp.getText();
            }
        }
    }
    
    public void getdata(){
        http p = new http();
        string url = 'https://api.linkedin.com/v2/me/~';
        httpRequest request = new httpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        request.setHeader('Authorization','Bearer'+ accesstoken);
        httpresponse response = p.send(request);
        result = response.getBody();
        
    }
    
    

}