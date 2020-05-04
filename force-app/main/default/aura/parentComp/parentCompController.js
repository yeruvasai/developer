({
	invoke : function(component, event, helper) {
        
		var name = event.getParam("empname");
        console.log(name);
        component.set("v.myname",name);
        
        console.log(name);
	}
})