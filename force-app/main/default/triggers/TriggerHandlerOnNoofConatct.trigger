trigger TriggerHandlerOnNoofConatct on Contact (After insert,After delete) {

    if(trigger.isinsert){
        noofContact.noofrecords(trigger.new);
    }
    if(trigger.isdelete){
        noofContact.noofrecords(trigger.old);
    }
    
}