({
	create : function(component, event, helper) {
		
        var emp = component.get("v.Employee");
        var action = component.get("c.saveStudent");
        action.setParams({
            "employee" : emp 
        });
        action.setCallback(this,function(a){
            var state = a.getState();
            if(state == "SUCCESS"){
                var name = a.getReturnValue();
                alert("Success");
            }
                else
                {
                    alert("Fail");
            }
        });
        $A.enqueueAction(action)
    }
        
})