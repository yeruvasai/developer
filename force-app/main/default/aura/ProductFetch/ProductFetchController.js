({
	init : function(component, event, helper) {
     component.set('v.prodcolumn', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
         {label: 'Author Name', fieldName: 'Author_Name__c', type: 'text'},
         {label: 'ISBN', fieldName: 'ISBN__c', type: 'text'},
        {label: 'View', type: 'button', initialWidth: 135, typeAttributes: { label: 'View Details', name: 'view_details', title: 'Click to View Details'}},
     ]);
         
        /*var pageRef=sessionStorage.getItem("varName");
         
         var custId= JSON.parse(pageRef);
         console.log(custId.customers);*/
          component.set("v.customers",component.get("v.pageReference").state.c__customers);
         var action = component.get("c.prodfet");
       
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.prodfetch", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
         updates : function(component, event, helper) {
         
         var custom = component.get("v.customers");
         console.log(custom);
         var action = event.getParam('action');
         var row  = event.getParam('row');
         console.log(row.Id);
         if(action.name == 'view_details'){
         $A.createComponent("c:ProductFetch_Popup",{ids:row.Id,cust:custom},
                           function(content,status){
                               if(status === "SUCCESS"){
                                   component.find('overlayLib').showCustomModal({
                                       header : "Application",
                                       body : content,
                                       showCloseButton : true
                                   });
                               }
                           }              
                           
                          )
         	
         }
         
         },
         
         mycart : function(component, event, helper) {
         var custom = component.get("v.customers");
         console.log(custom);
         var action = component.get("c.mycartrec");
         action.setParams({custId:custom});
         action.setCallback(this,function(response){
         	var state = response.getState();
         	if(state == "SUCCESS"){
         		var value = response.getReturnValue();
         		component.set("v.cartlist",value);
         console.log(value);
         $A.createComponent("c:Cart_popup",{cartrec:value},
                           function(content,status){
                               if(status === "SUCCESS"){
                                   component.find('overlayLib').showCustomModal({
                                       header : "Account Details",
                                       body : content,
                                       showCloseButton : true
                                   });
                               }
                           }              
                           
                          )
         }
         
         });
         $A.enqueueAction(action);
         
         	
         
         
         }
         
   
})