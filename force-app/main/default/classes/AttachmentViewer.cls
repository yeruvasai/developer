public class AttachmentViewer
{

    public Boolean check { get; set; }

    public Boolean IsActive { get; set; }
    public Attachment a{get; set;}
    
    public Document document {
    get {
      if (document == null)
        document = new Document();
      return document;
    }
    set;
  }
    

    public PageReference Save() {
    //document.AuthorId = UserInfo.getUserId();
    //document.FolderId = UserInfo.getUserId(); // put it in running user's folder
   // document.Name = document.name;
 
    
    
try {
    if(check){
     
     
     Document d= new Document ();
     d.FolderId = UserInfo.getUserId();
     d.AuthorId = UserInfo.getUserId();
     d.Name= a.Name;
     insert d;
     ApexPages.addMessage(new ApexPages.message(ApexPages.severity.CONFIRM,'File saved successfully'));
      }
     else if(!check){
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'If check box is not selected then file will not be saved'));
      
      }
      
    
    } catch (DMLException e) {
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error saving file'));
      
      return null;
    } finally {
      document.body = null; // clears the viewstate
      document = new Document();
    }
 
    
    return null;
  }
    


    public String contact { get; set; }

    public PageReference Cancel() {
    return null;
 
}

public list<Attachment> att{get;set;}

        
public AttachmentViewer()
{
att=[Select a.Id,a.ContentType,a.ParentId,a.Parent.Type,a.Parent.Name,a.OwnerId,
 a.Owner.Name, a.Name, a.LastModifiedDate, a.BodyLength From Attachment a];
 a=new Attachment();

}

}