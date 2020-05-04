@RestResource(urlmapping = '/newCustomer/*')
global class Rest_Example {
    @HttpGet
    global static string create(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string name = req.params.get('name');
        string industry = req.params.get('industry');
        System.JSONGenerator jp = JSON.createGenerator(true);

        jp.writeStartObject();
        jp.writeFieldName('Status');
        try{
            Account acc = new Account();
            acc.Name = name;
            acc.Industry = industry; 
            insert acc;
            jp.writeString('Success');
            jp.writeIdField('Id',acc.Id);
        }
        catch(exception e){
            jp.writeString('Failed');
        jp.writeStringField('Error',e.getMessage());
        }
        jp.writeEndObject();
        string result = jp.getAsString();
        return result; 
        
    }
    @Httppost
    global static string invoke(string name,string industry){
        system.JSONGenerator jp = JSON.createGenerator(true);
        jp.writeStartObject();
        jp.writeFieldName('Status'); 
        try{
            Account acc = new Account();
            acc.Name = name;
            acc.Industry = industry; 
            insert acc;
            jp.writeString('Success');
            jp.writeIdField('Id',acc.Id);
        }
        catch(exception e){
            jp.writeString('Failed');
        jp.writeStringField('Error',e.getMessage());
        }
        jp.writeEndObject();
        string result = jp.getAsString();
        return result;
        
    }
    

}