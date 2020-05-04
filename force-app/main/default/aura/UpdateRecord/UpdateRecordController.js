({
	search : function(component, event, helper) {
		var action=component.get("c.recordSearch");
        action.setParams({
            'searchKeyWord':component.get("v.Searchtext")
        })
        action.setCallback(this,function(response){
             var state = response.getState();
            if (state === "SUCCESS") {           
                var allValues = response.getReturnValue();
                if(allValues.length==0){
                    component.set("v.Message",true);
                }
                else{
                    component.set("v.Message",false);
                }
                component.set("v.TotalNumberOfRecords", allValues.length);
                component.set("v.searchResult",allValues);
            }   
            else
            {
            alert("error");
            }
        });
        $A.enqueueAction(action);
	}      
})