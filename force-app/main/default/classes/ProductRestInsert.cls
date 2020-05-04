@RestResource(urlMapping='/createproduct/*')
global class ProductRestInsert {
    public static list<wrapper> wrap{get;set;}
    
    @HttpPost
    global static string getProduct(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string jsonString = req.requestBody.tostring();
        
         wrap = (list<wrapper>)JSON.deserialize(jsonString,list<wrapper>.class);
       
        return 'Success';
        
        
    }
    global class wrapper{
        global string name{get;set;}
        global decimal item{get;set;}
        global string unit{get;set;}
        global decimal stock{get;set;}
    }

}