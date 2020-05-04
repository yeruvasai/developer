public class JSON_EX_5 {
    
    public string jsonstring {set;get;}
    public string accesstoken {set;get;}
    public void gettoken(){
        system.JSONParser jp=JSON.createParser(jsonString);
        system.debug(jsonString);
        while(jp.nextToken()!= null){
            if(jp.getText() == 'access_token'){
               
                jp.nextToken();
                accesstoken = jp.getText();
            }
        }
    }
}