({
	show : function(component, event, helper) {
        
         component.set('v.regcolumn', [
        
            {label: 'LastName', fieldName: 'Name', type: 'text'}
             ]);
        
		var name = event.getParam("temp");
         component.set("v.temp",name);
        
        var rows = [];
        component.set("v.selectrow",rows);
        
        var temp = component.get("v.temp");
    	var ids =[];
    	temp.forEach(deletefunc);
    function deletefunc(item){
    ids.push(item.Id);
    console.log(item.Id);
}
        var action = component.get("c.delrec");
        action.setParams({
            del : ids
        });
		action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.reg", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);  
	}
})