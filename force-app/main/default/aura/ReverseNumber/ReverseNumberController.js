({
	trans : function(component, event, helper) {
        
        var sum = component.get("v.num1");
        for(i=sum;i<11;i++){
            component.set("v.num2");
        }
		
	}
})