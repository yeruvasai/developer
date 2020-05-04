public class HTTP_EX_3 {
    
    public string result {set;get;}
    
    public void invoke(){
        Map<string,APIKeys__c> mymap = APIKeys__c.getAll();
        APIKeys__c ak = mymap.get('currency');
        string key = ak.key__c;
        string url = 'http://apilayer.net/api/live?accesss_key='+key;
        url=url+'&currencies=INR';
        url=url+'&source=USD&format=1';
		
		http p = new http();
		httpRequest req = new httpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
		httpResponse res = new httpResponse();
        res = p.send(req);
        string body = res.getBody();
        system.JSONParser jp = JSON.createParser(body);
        while(jp.nextToken()!=null){
            if(jp.getText()=='USDINR'){
                jp.nextToken();
                decimal val =(decimal)jp.getDecimalValue();
                system.debug('INR :'+val);
            }
        }
        
        
    }

}