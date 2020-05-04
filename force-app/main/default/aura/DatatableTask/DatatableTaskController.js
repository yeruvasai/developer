({
	init : function(component, event, helper) {
     component.set('v.recfetcolumn', [
            {label: 'Name', fieldName: 'Name', type: 'text',editable: true},
         {label: 'Parent Name', fieldName: 'Parent_Name__c', type: 'text',editable: true},
         {label: 'Class Name', fieldName: 'Class_Name__c', type: 'text',editable: true},
         {label: 'Mobile Number', fieldName: 'Mobile_Number__c', type: 'phone',editable: true}
            
     ]);
        
        component.set('v.column', [
            {label: 'Name', fieldName: 'Name', type: 'text',editable: true},
         {label: 'Parent Name', fieldName: 'Parent_Name__c', type: 'text',editable: true},
         {label: 'Class Name', fieldName: 'Class_Name__c', type: 'text',editable: true},
         {label: 'Mobile Number', fieldName: 'Mobile_Number__c', type: 'phone',editable: true}
            
     ]);
        
       
       // var sear = component.get("v.recordfetch")
         var action = component.get("c.recordfet");
       // action.setParams({
          //  "recfet" : sear
        //});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.recordfetch", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    updateSelectedText:function(component,event,helper){
        
        var rows = event.getParam("selectedRows");
               var data = component.get("v.recordfetch");
        	   var data1 = component.get("v.fetch");
        rows.forEach(select)
        function select(result){
            data1.push(result);
            var sear = data.indexOf(result);
            data.splice(sear,1);
        }
        var num=[];
        component.set("v.selectrow",num);
        component.set("v.recordfetch",data);
        component.set("v.fetch",data1);
    },
    updatetext:function(component,event,helper){
        
        var add = event.getParam("selectedRows");
               var data = component.get("v.recordfetch");
        	   var data1 = component.get("v.fetch");
        add.forEach(select)
        function select(result){
            data.push(result);
            var sear = data1.indexOf(result);
            data1.splice(sear,1);
        }
        var num=[];
        component.set("v.rows",num);
        component.set("v.recordfetch",data);
        component.set("v.fetch",data1);
    },
    onSave : function (component, event, helper) {
    
    var editable = component.find("datatable").get("v.draftValues");
        component.set("v.updatedRecord",editable);
        var data=component.get("v.updatedRecord");
        console.log(data);
	var action = component.get("c.updatecontact");
        action.setParams({
            acc : data
        });
		action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
            $A.get('e.force:refreshView').fire();
            }
            else{
                alert("FAil");
            }
        });        
	     $A.enqueueAction(action);   
    },
    
    
    
    
})