public class CustomerPopup {
    
    @auraenabled 
    
    public static list<document> doc(){
       /* set<id> ids = new set<id>();

   for(Account curr:[SELECT ID FROM Account ])

    ids.add(curr.id);
        List<Attachment> attachments = [SELECT name FROM Attachment WHERE ParentID IN: ids];
        system.debug(attachments);
        return attachments;*/
        list<document> docu = [select Id,Name,Body,ContentType, BodyLength from Document];
        system.debug(docu);
        return docu;
        
        
    }
    
    
    
      @auraenabled 
    public static void mailsend(string mails,id ids){
        
        document docs = [select Id,Name,Body,ContentType, BodyLength from Document where id=: ids];
        
        messaging.SingleEmailMessage semail = new messaging.SingleEmailMessage();
       // string[] sending = new string[]{mails};
        semail.ToAddresses = new string[]{mails};
		semail.setSubject('Document');
        semail.setPlainTextBody('Please Find The Attachment');
        messaging.EmailFileAttachment ef = new messaging.EmailFileAttachment();
        ef.setFileName(docs.name);
        ef.setBody(docs.body);
        semail.setFileAttachments(new messaging.EmailFileAttachment[]{ef});
        messaging.sendEmail(new messaging.SingleEmailMessage[]{semail});
    }

}