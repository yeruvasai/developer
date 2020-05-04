({
	submit : function(component, event, helper) {
        
        var cand = component.get("v.regform");
        var action = component.get("c.regins");
        action.setParams({candetails:cand});
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log(state);
            if(state == "SUCCESS"){
               
                var value = response.getReturnValue().Id;
                console.log(value);
                var pageRef = component.find("navigation");
                     var pageReferenceNavigation  = {    
          "type": "standard__component",
          "attributes": {
              "componentName": "c__ProductFetch"    
          },
        /*  "state":{
              "c__customers":value
          } */

};
             console.log('hi');
      pageRef.navigate(pageReferenceNavigation);
                
            }
        });
		$A.enqueueAction(action);
	}
})