({
	show : function(component, event, helper) {
        
        var num = component.find("name").get("v.value");
        console.log(num);
        var evt=$A.get("e.c:childEvent");
        evt.setParams({"accname":num});
       
        evt.fire();
		
	}
})