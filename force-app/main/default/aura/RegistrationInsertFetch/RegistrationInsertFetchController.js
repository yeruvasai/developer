({
  
    updateSelectedText:function(component,event,helper){
        
        var chec = event.getParam("selectedRows");
                component.set("v.temp",chec);
    
    },
	   
    deleteSlctd: function(component,event,helper){
        
        var rows = [];
        component.set("v.selectrow",rows);
        
        var temp = component.get("v.temp");
    	var ids =[];
    	temp.forEach(deletefunc);
    function deletefunc(item){
    ids.push(item.Id);
    console.log(item.Id);
}
        var action = component.get("c.delrec");
        action.setParams({
            del : ids
        });
		action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.reg", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);        
        
    },
    
    
    init : function(component, event, helper) {
     component.set('v.regcolumn', [
         {label:'Id' ,fieldName: 'Id' , type:'id'},
            {label: 'LastName', fieldName: 'Name', type: 'text'}
            
        ]);
        var sear = component.get("v.Searchtext")
         var action = component.get("c.regfetch");
        action.setParams({
            "regis" : sear
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.reg", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
            
   
        
    }
    
    
         
    
})