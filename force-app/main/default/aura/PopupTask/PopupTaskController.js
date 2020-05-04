({
	init : function(component, event, helper) {
        
        var action = component.get("c.popup");
        
        action.setCallback(this,function(response){
           var State = response.getState();
            if(State == 'SUCCESS'){
                var value = response.getReturnValue();
                component.set("v.account",value);
            }
        });
		$A.enqueueAction(action);
	},
    submit : function(component,event,helper){
        var name=event.srcElement.id;
        console.log(name);
        $A.createComponent("c:PopupTaskParent",{acc:name},
                           function(content,status){
                               if(status === "SUCCESS"){
                                   component.find('overlay').showCustomModal({
                                       header : "Account Details",
                                       body : content,
                                       showCloseButton : true
                                   });
                               }
                           }              
                           
                          )
    },
    
     handleClick : function(component,event,helper){
        var rowRecord = event.getSource().get('v.value').Id;
         
         
        $A.createComponent("c:PopupTaskParent",{acc:rowRecord},
                           function(content,status){
                               if(status === "SUCCESS"){
                                   component.find('overlay').showCustomModal({
                                       header : "Account Details",
                                       body : content,
                                       showCloseButton : true
                                   });
                               }
                           }              
                           
                          )
    }
    
})