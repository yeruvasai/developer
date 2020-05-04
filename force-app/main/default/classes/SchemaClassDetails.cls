public class SchemaClassDetails {

    public list<SelectOption>getObjfields() {
        return null;
    }

    
     

//Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();

public List<SelectOption> getobjNames()
{
List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
List<SelectOption> options = new List<SelectOption>();
options.add(new SelectOption('--None','--None--'));
for(Schema.SObjectType f : gd)
{
options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
}
return options;
}
}