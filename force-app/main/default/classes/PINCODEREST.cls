public class PINCODEREST {
    
    @auraenabled
    
    public static string invoke(string pincode){
        string pin = pincode;
        system.debug(pin);
        string url = 'https://api.postalpincode.in/pincode/'+pin;
        system.debug(url);
        http p = new http();
        httprequest request = new httprequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        httpresponse response = new httpresponse();
        response = p.send(request);
        string jsonstring = response.getBody();
        system.JSONParser jp = JSON.createParser(jsonstring);
        string place = '';
        while(jp.nextToken()!=null){
            if(jp.getText()=='name'){
                jp.nextToken();
                place=place+','+jp.getText();
            }
        }
        //aname = place;
        return place;
    }


}