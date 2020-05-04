public class JSON_EX_4 {
    
    public string name {set;get;}
    public string phone {set;get;}
    public decimal annualrevenue {set;get;}
    public string result {set;get;}
    public void create(){
        system.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        	account a = new account();
        try{
            a.name = name ;
            a.phone = phone ;
            a.AnnualRevenue = annualrevenue;
            insert a;
            js.writeStringField('status', 'success');
            js.writeIdField('Id',a.id);
        }catch(Exception e){
            js.writeStringField('status', 'failed');
            js.writeStringField('error', e.getMessage());
        }
        js.writeEndObject();
        result = js.getAsString();
    }

}