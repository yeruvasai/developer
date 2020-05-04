({
	submit : function(component, event, helper) {
        var name=component.get("v.email");
        console.log(name);
        $A.createComponent("c:ParentCustomerPopup",{acc:name},
                           function(content,status){
                               if(status === "SUCCESS"){
                                   component.find('overlay').showCustomModal({
                                       header : "Send Documents",
                                       body : content,
                                       showCloseButton : true
                                   });
                               }
                           }              
                           
                          )
    }
		
	
})