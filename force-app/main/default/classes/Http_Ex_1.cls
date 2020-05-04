public class Http_Ex_1 {
    
    public string url {set;get;}
    public string body {set;get;}
    public string result {set;get;}
    public list<map<string,string>> bk {set;get;}
    
    public void invoke(){
        bk = new list<map<string,string>>();
        result = '';
        http p = new http();
        
        httprequest request = new httprequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        httpresponse response = new httpresponse();
        response = p.send(request);
        body = response.getBody();
       
        
        Dom.Document doc = new Dom.Document();
        doc.load(body);
        Dom.XmlNode root = doc.getRootElement();
        list<Dom.XmlNode> booke = root.getChildElements();
        system.debug(booke);
        for(Dom.XmlNode child:booke){
            map<string,string> mapbk = new map<string,string>();
            list<Dom.XmlNode> books = child.getChildElements();
              for(Dom.XmlNode Childs:books){
             	mapbk.put(childs.getName(),childs.getText());
                  system.debug(mapbk);
            }
            bk.add(mapbk);
        }
        
        list<Book__c> book = new list<Book__c>();
        for(map<string,string> b:bk){
            Book__c bo = new Book__c();
            bo.name = b.get('title');
            bo.Author_Name__c = b.get('author');
            bo.ISBN__c = b.get('isbn');
            book.add(bo);
        }
        insert book;
    }

}