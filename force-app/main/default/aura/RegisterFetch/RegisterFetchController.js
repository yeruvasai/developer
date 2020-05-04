({
	init : function(component, event, helper) {
        component.set('v.formcolumn',[
             {label: 'Student Name', fieldName: 'Name', type: 'text'}
        ]);
		
	},
    dosearch : function(component,event,helper){
    	var sea = component.get("v.searchtext") ;
       
        var action = component.get("c.regfetch") ;
    
    action.setParams({
    forms : sea
    });
    action.setCallback(this,function(response){
    var state = response.getState();
    if (state === "SUCCESS") {
           var allvalues=response.getReturnValue();    
        component.set("v.register", allvalues);
            }
        });
        $A.enqueueAction(action);
            }
})