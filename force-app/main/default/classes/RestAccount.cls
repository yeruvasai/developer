@RestResource(URLMapping='/RestAccount/')
global class RestAccount {
    
    @httppost
    
    webservice static string insertaccount(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string body = req.requestBody.toString();
        account acc = new account();
        acc = (account)JSON.deserialize(body, account.class);
        insert acc;
        return acc.Id;
    }

}