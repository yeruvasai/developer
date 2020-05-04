({
	show : function(component, event, helper) {
        
        var evt = component.getEvent("firstcell");
        
        evt.setParams({"empname":"prasad reddy"});
        
        
        
        evt.fire();
		
	}
})