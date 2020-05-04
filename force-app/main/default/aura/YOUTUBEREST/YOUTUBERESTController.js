({
	submit : function(component, event, helper) {
         var sear = component.get("v.search");
        console.log(sear);
        var action = component.get("c.search");
        action.setParams({searchtext:sear});
        action.setCallback(this,function(response){
           var State = response.getState();
            if(State == "SUCCESS"){
                 var value=JSON.parse(response.getReturnValue());
                console.log(value.items);
                component.set("v.dat",value.items);
            }
        });
		$A.enqueueAction(action);
	}
})