using System;
using System.Collections.Generic;
using System.Text;

public class Email
{
    public string Sender;
    public string Receiver;
    public string Message;
    public int Priority;
    public bool Sent = false;

    public Email(string sender, string receiver, string message, int priority)
    {
        this.Sender = sender;
        this.Receiver = receiver;
        this.Message = message;
        this.Priority = priority;
    }

    public bool Send()
    {
        if (Sent == true)
        {
            Sent = false;
            return Sent;
        }
        Sent = true;
        MailAccount.accounts["receiver"].inbox.Add(this);
        return Sent;
    }
}

public class MailAccount
{
    public static Dictionary<string, MailAccount> accounts = new Dictionary<string, MailAccount>();
    public List<Email> inbox = new List<Email>();
    public int i = 0;

    public Email[] GetInbox()
    {
        Email[] testInbox = new Email[inbox.Count];
        while(i < testInbox.Length)
        {
            testInbox[i] = inbox[i];
            i++;
        }
        return testInbox;
    }
}
