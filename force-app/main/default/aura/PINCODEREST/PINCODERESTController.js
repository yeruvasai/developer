({
	submit : function(component, event, helper) {
        
        var pin = component.get("v.codes");
        console.log(pin);
        var action = component.get("c.invoke");
        action.setParams({pincode:pin});
        action.setCallback(this,function(response){
          var state = response.getState();
            if(state == "SUCCESS"){
                 alert('SUCCESS');
                var value = response.getReturnValue();
                console.log(value);
                component.set("v.addres",value);
            }
            else{
                alert('FAILED');
            }
        });
		$A.enqueueAction(action);
	}
})