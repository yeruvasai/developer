public class Schema_obj_fields {

    public list<SelectOption> recids { get; set; }
    public list<sObject> objlist {get; set;}
    public String FieldsList { get; set; }
    public String ObectsList { get; set; }
    public Map<String,schema.SObjectType> objMap{get;set;} 
    public Map<String,schema.SObjectField> fMap{get;set;}
    
    public List<SelectOption> getObjects() {
        
        List<SelectOption> objectNames=new List<SelectOption>();
        List<String> objlist=new List<String>();
        objMap=schema.getGlobalDescribe();
        objlist.addAll(objMap.keyset());
        objlist.sort();
        SelectOption op=new SelectOption('None','--None--');
        objectNames.add(op);
        for(String str:objlist){
            objectNames.add(new SelectOption(str,str));
        }
        return objectNames;
    }
    
    public List<SelectOption> getfields() {
        
        List<SelectOption> fieldNames=new List<SelectOption>();
        if(ObectsList!=null){
            fMap=objMap.get(ObectsList).getDescribe().fields.getMap();
            SelectOption op=new SelectOption('None','--None--');
            fieldNames.add(op);
            for(String str:fMap.keyset()){
                fieldNames.add(new SelectOption(str,str));
            }
        }
        getrecids();
        return fieldNames;
    }
    
    public list<SelectOption> getrecids (){
        
        recids = new list<SelectOption>();
        objlist = new list<sObject>();
        if(ObectsList!=null){
        
            string queryid = 'select name from'+ObectsList;
              objlist = database.query(queryid);
              for(sObject asd:objlist){
                  recids.add(new SelectOption((string)asd.get('id'),(string)asd.get('name')));
              }         
        
    }
    return recids;
}
}