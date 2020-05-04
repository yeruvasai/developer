({
	submit : function(component, event, helper) {
        
        var mail = component.get("v.emails");
        console.log(component.get("v.emails"));
        var pass = component.get("v.passwords");
        var action = component.get("c.submits");
        action.setParams({email:mail,word:pass});
        action.setCallback(this,function(response){
            var state= response.getState();
            console.log(state);
            console.log(response.getReturnValue());
            if(state == "SUCCESS"){
                if(response.getReturnValue()!= null){
                var value= response.getReturnValue().Id;
                    console.log(value);
                var pageRef = component.find("navigation");
                     var pageReferenceNavigation  = {    
          "type": "standard__component",
          "attributes": {
              "componentName": "c__ProductFetch"    
          },
          "state":{
              "c__customers":value
          }
};
      pageRef.navigate(pageReferenceNavigation);
       
       /*var pageReferenceNavigation  = {    
           "type": "comm__namedPage",
           "attributes": {
               "name": "ProductList__c"    
           },
           "state":{
               "customers":value
           }
};
        sessionStorage.setItem("varName",JSON.stringify(pageReferenceNavigation.state));
       pageRef.navigate(pageReferenceNavigation);*/
            }
                else{
                    alert ('incorrect Id or Password');
                }
            }
            else{
                alert('FAIL');
            }
            
        });
		$A.enqueueAction(action);
	},
    signup : function(component, event, helper) {
        console.log('hi');
        $A.createComponent("c:Registration_page",{},
                           function(content,status){
                               if(status === "SUCCESS"){
                                   component.find('overlayLib').showCustomModal({
                                       header : "Registrion Page",
                                       body : content,
                                       footer : "Powered by Scart",
                                       showCloseButton : true
                                   });
                               }
                           }              
                           
                          )
    }
})