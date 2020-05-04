({
	saverec : function(component, event, helper) {
		var custId = component.get("v.ids");
        	console.log(custId);
        var prodId = component.get("v.cust");
        	console.log(prodId);
        var action = component.get("c.cartins");
        action.setParams({customers:custId,products:prodId});
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state == "SUCCESS"){
                var value = response.getReturnvalue().Id;
                alert(value);
            }
            else{
                alert('Fail');
            }
        });
        $A.enqueueAction(action);
	}
})