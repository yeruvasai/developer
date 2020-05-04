({
	click : function(component, event, helper) {
        
        var name = event.getParam("accname");
        console.log(name);
        var action = component.get("c.getcall");
        action.setParams({"accs":name});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var result = response.getReturnValue();
                console.log(result);
                component.set("v.con",result);
                console.log(component.get("v.con"));
            }
        });
        $A.enqueueAction(action);
		
	}
})