({
	submit : function(component, event, helper) {
        
        var rec = component.get("v.recordinsert");
        
        var action = component.get("c.recordins");
        
        action.setParams({
            recins : rec
        });
        
        action.setCallback(this,function(response){
            
            var state = response.getState();
            
            if(state === "SUCCESS"){
                
                var name = response.getReturnValue();
                console.log(name);
                alert("SUCCESS");
            }
            else if(state === "ERROR"){
                var error = response.getError();
                console.log(error);
                if(error){
                    alert(error[0].message);
                }
            }
            
            
        });
		$A.enqueueAction(action);
	},
})