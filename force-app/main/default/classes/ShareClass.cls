public class ShareClass {

    public String acc { get; set; }

    public List<Account> getAcclist() {
        return[SELECT Name,Type FROM Account limit 10];
    }

}