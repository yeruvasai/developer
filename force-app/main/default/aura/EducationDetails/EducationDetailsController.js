({
	submit1 : function(component, event, helper) {
        
        var details = component.get("v.educationdetail");
        var selectitem = event.currentTarget ; 
        var index = selectitem.dataset.record;      
        details.splice(index,1);
		component.set("v.educationdetail", details);
		
	}
})