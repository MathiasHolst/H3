using NUnit.Framework;
using System;
using System.Collections.Generic;

[TestFixture]
public class EmailTest
{
    /*
     * I denne class er der en lang række tests. Du skal implementere to classes
     * "Email" og "MailAccount" som gør at alle disse tests vil kunne køre
     * successfuldt. Du må IKKE ændre på disse tests. Når den er accepteret
     * skal du aflevere en .cs fil med disse classes i sig.
     */

    [Test]
    public void EmailConstructorSetsVariables() {
        var testEmail = new Email("sender", "receiver", "message", 5);
        Assert.That(testEmail.Sender, Is.EqualTo("sender"));
        Assert.That(testEmail.Receiver, Is.EqualTo("receiver"));
        Assert.That(testEmail.Message, Is.EqualTo("message"));
        Assert.That(testEmail.Priority, Is.EqualTo(5));
    }

    [Test]
    public void EmailSentStartsFalse() {
        var testEmail = new Email("sender", "receiver", "message", 5);
        Assert.That(testEmail.Sent, Is.False);
    }

    [Test]
    public void EmailAccountHasStaticDictionaryAccounts() {
        Assert.That(MailAccount.accounts, Is.TypeOf<Dictionary<string, MailAccount>>());
        Assert.That(MailAccount.accounts, Is.Not.Null);
    }

    [Test]
    public void EmailSendIsCallable() {
        var testEmail = new Email("sender", "receiver", "message", 5);
        MailAccount.accounts["receiver"] = new MailAccount();

        Assume.That(testEmail.Sent, Is.False);

        Assert.That(testEmail.Send, Throws.Nothing);
    }

    [Test]
    public void EmailSendCannotBeCalledIfAlreadySent() {
        var testEmail = new Email("sender", "receiver", "message", 5);
        MailAccount.accounts["receiver"] = new MailAccount();

        Assume.That(testEmail.Sent, Is.False);
        Assume.That(testEmail.Send, Throws.Nothing);

        Assert.That(testEmail.Send(), Is.False);
    }

    [Test]
    public void EmailAccountGetInboxReturnsArrayOfEmails() {
        var testEmail = new Email("sender", "receiver", "message", 5);
        MailAccount.accounts["receiver"] = new MailAccount();

        Assume.That(testEmail.Sent, Is.False);
        Assume.That(testEmail.Send(), Is.True);

        Email[] array = MailAccount.accounts["receiver"].GetInbox();
        Assert.That(array[0].Message, Is.EqualTo("message"));
    }
}