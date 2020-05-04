public class OAUTH_EX_1 {
    
    public string endpoint {set;get;}
    public string username {set;get;}
    public string password {set;get;}
    public string clientid {set;get;}
    public string clientsecret {set;get;}
    public string accesstoken {set;get;}
    public string result {set;get;}
    
    public OAUTH_EX_1 (){
        username = 'prasad@spr.com';
        password = 'yeruvasai159mkZ6CUKSr5oNI2LFlHuzFrm';
        clientid = '3MVG9YDQS5WtC11pqwERNnZCznVGcpdXhiW7_xYEqJHTUXc7HTufizJkA5r8THMRlzv552OcOQuSK37YrlItl';
        clientsecret = '90B0394E407A92F04AE80435AAD68E2C211AEBB458B751B62981792D61A32BB5';
        endpoint = 'https://login.salesforce.com/services/oauth2/token';
     }
    
    public void invoke(){
        http p = new http();
        httpRequest req = new httpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST'); 
        string body ='grant_type=password';
        body = body+'&client_id='+clientid;
        body = body+'&client_secret='+clientsecret;
        body = body+'&username='+username;
        body = body+'&password='+password;
        system.debug(body);
        req.setBody(body);
        httpResponse res = p.send(req);
         result = res.getBody();
        system.debug(result);
        system.JSONParser jp = JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText() == 'access_token'){
                jp.nextToken();
                accesstoken = jp.getText();
            }
        }
        
    }

}