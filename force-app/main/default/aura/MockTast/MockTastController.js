({
	init : function(component, event, helper) {
        
        var names = component.get("v.accountrecords");
        var action = component.get("c.cit");
        action.setParams({
            
        });
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state == 'SUCCESS'){
                var result = response.getReturnValue();
           console.log(result);
                    component.set("v.accountrecords",result);
                
            } 
        });
		$A.enqueueAction(action);
	},
    
    changefeilds : function(component, event, helper) {
         var columns=[{label:"Opportunity",fieldName:"opportunityid",type:"text"},
                    {label:"Account",fieldName:"accountid",type:"text"},
                    {label:"productcode",fieldName:"productid",type:"text"}];
       component.set("v.columns",columns)
       
     var value=component.get("v.selectValue");
       
        console.log(value);
       var action=component.get("c.getData")
       action.setParams({value:value});
       action.setCallback(this,function(response){
           var state=response.getState();
           if(state=="SUCCESS"){
               var data=response.getReturnValue();
               console.log(data);
               component.set("v.data",data);
           }
       });
       $A.enqueueAction(action);
}

})