({
	addRow : function(component, event, helper) {
        
        var num = component.get("v.textbox");
       		console.log(num);
		var num1 = [];
        for(var i=0;i<num;i++){
        
		var details = component.get("v.rowdynamically");
            console.log(details);
        var cursize = parseInt((details.length));
            console.log(cursize);
        var newsize = parseInt((cursize)+1);
        num1.push(newsize);
        console.log(num1);
        }
        component.set("v.rowdynamically",num1);
        
	},
   
})