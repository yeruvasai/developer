({
	onCheck : function(component, event, helper) {
        
        var bill = component.get("v.shipping");
        
        var check = component.find("checkbox").get("v.value");
        if(check){
            bill.ShipingStreet = bill.BillingStreet;
            bill.ShipingCity = bill.BillingCity;
            bill.ShipingState = bill.BillingState
            bill.ShipingPostalCode = bill.BillingPostalCode;
            bill.ShipingCountry = bill.BillingCountry;   
        }
		component.set("v.shipping",bill);
	}
})