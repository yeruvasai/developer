public class YOUTUBEREST {
    
    
    public static string searchurl ='https://www.googleapis.com/youtube/v3/search';
    public static string apikey = 'AIzaSyAsFBvpqBKv1r5Qbo7oV3HIxGXlR0eARZY';

    //@auraenabled public static YOUTUBEREST.items[] dat{get;set;}
    @auraenabled
   
    public static string search(string searchtext){
        system.debug(searchtext);
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        string endpoint = searchurl + '?part=snippet' + '&maxResults=3' + '&type=video' + '&q=' + EncodingUtil.urlEncode(searchText, 'UTF-8') +
            '&key=' + apikey;
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        /*system.debug('Response'+res.getBody());
        response Resp = (response)JSON.deserialize(res.getBody(),YOUTUBEREST.response.class); 
        dat  = resp.items;
        system.debug(dat);*/
        return res.getBody();
    }
    
    

}