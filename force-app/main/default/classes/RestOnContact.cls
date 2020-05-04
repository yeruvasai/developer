@restResource(urlmapping='/ContactCreate/*')
global class RestOnContact {
	@HttpPost
    global static string voke(string Name,integer price){
        system.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        try{
            Bottle__c bot = new Bottle__c();
            bot.Name = Name;
            bot.Price__c = price;
            insert bot;
            js.writeStringField('status','success');
            js.writeIdField('id', bot.Id);
        }
        catch(Exception e){
            js.writeStringField('status','Failed');
            js.writeStringField('Error',e.getTypeName());
        }
        
        js.writeEndObject();
        string res = js.getAsString();
    return res;
}
}