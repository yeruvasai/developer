({
	submit : function(component, event, helper) {
        
        var rec = component.get("v.recordinsert");
        
        var action = component.get("c.recordins");
        
        action.setParams({
            recins : rec
        });
        
        action.setCallback(this,function(response){
            
            var state = response.getState(); 
            
            if(state === "SUCCESS"){
                
                //var name = response.getReturnValue();
                //alert("SUCCESS");
                $A.get('e.force:refreshView').fire();
            }
            else{
                alert("FAil");
            }
            
        });
		$A.enqueueAction(action);
	},
    
    init : function(component, event, helper) {
     component.set('v.recfetcolumn', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
         {label: 'Parent Name', fieldName: 'Parent_Name__c', type: 'text'},
         {label: 'Class Name', fieldName: 'Class_Name__c', type: 'text'},
         {label: 'Mobile Number', fieldName: 'Mobile_Number__c', type: 'phone'}
            
     ]);
       // var sear = component.get("v.recordfetch")
         var action = component.get("c.recordfet");
       // action.setParams({
          //  "recfet" : sear
        //});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.recordfetch", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
   
    
      
})