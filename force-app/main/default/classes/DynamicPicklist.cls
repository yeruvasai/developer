public class DynamicPicklist {
    
    @auraenabled
    
    public static list<string> dynamic(){
        
        list<string> plist = new list<string>();
        
        list<schema.SObjectType> rec = schema.getGlobalDescribe().values();
        
        for(SObjectType record:rec){
            plist.add(record.getDescribe().getName());
        }
        return plist;
    }
    
    @auraenabled
    
    public static list<string> selectobj (string sel){
        
        map<string,schema.SObjectField> selfields = schema.getGlobalDescribe().get(sel).getDescribe().fields.getMap();
        list<schema.SObjectField> file = selfields.values();
        
        list<string> fields = new list<string>();
        for(SObjectField fi:file){
            string fil = string.valueOf(fi);
            fields.add(fil);
        }
        
        
        return fields;
        
    }
    
    @auraenabled
    
    public static list<string> selectfie(string obj,list<string> fie){
        
        system.debug(obj);
        system.debug(fie);
        
        SObjectType sobj = schema.getGlobalDescribe().get(obj);
        list<string> sobjs = new list<string>();
        for(string f:fie){
            SObjectfield fiel = sobj.getDescribe().fields.getMap().get(f);
            DisplayType datatypes = fiel.getDescribe().getType();
            string st = string.valueOf(datatypes);
            sobjs.add(st);
        }
        return sobjs;
        
    }

}