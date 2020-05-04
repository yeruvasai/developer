({
	submit : function(component, event, helper) {
		
        var regform = component.get("v.reg");
        
        var action = component.get("c.reginsert");
        
        action.setParams({
            "regs" : regform
        });
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var name = response.getReturnValue();
                alert("SUCCESS");
                var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": name,
      "slideDevName": "related"
    });
    navEvt.fire();
            }
            
            else
            {
                alert("FAIL");
            }
        });
        
        $A.enqueueAction(action)
	}
})