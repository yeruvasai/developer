trigger Account_Banking on Account (before insert) 
{
    list<account> acc = trigger.new;
    for(account acc1 :acc)
    {
        if(acc1.Industry=='banking')
        {
            acc1.phone = '888';
        }
    }
}