public class JSON_EX_3 {
    
    public string jsonstring {get;set;}
    public map<string,object> resmap {get;set;}
    
    public JSON_EX_3(){
        system.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        js.writeFieldName('EMPNAME');
        js.writeString('sai');
        js.writeFieldName('age');
        js.writeNumber(20);
        js.writeStringField('branch', 'hyd');
        js.writeDateField('today', system.today());
        string val = 'abcdefg';
        blob body = blob.valueOf(val);
        js.writeBlobField('pass', body);
        js.writeEndObject();
        jsonstring=js.getAsString();
    }
    
    public void getdata(){
        resmap = new map<string,object>();
        system.JSONParser jp = JSON.createParser(jsonString);
        while(jp.nextToken()!= null){
            resmap.put(jp.getText(),''+jp.getCurrentToken());
        }
    }
    

}