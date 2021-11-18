using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;

namespace Tests
{
    [TestFixture()]
    public class PersonTests
    {
        [Test()]
        public void AssignNewJobTest()
        {
            Person person = new Person("Mathias", "Holst", 18, JobTypes.Programmer);
            person.AssignNewJob("Barber");
            Assert.That(person.GetJob() == null);
        }

        [Test()]
        public void AssignNewJobTestKorrektTypeAfJob()
        {
            Person testPersonen = new Person("Mathias", "Holst", 18, JobTypes.Programmer);
            testPersonen.AssignNewJob("Comedian");
            Assert.That(testPersonen.GetJob() != null);
        }

        [Test()]
        public void GetFullNameTest()
        {
            Person testPersonen = new Person("Mathias", "Holst", 18, JobTypes.Politician);
            Assert.That(testPersonen.GetFullName() == "Mathias Holst");
        }

        [Test()]
        public void MinusAldersTest()
        {
            Person testPersonen = new Person("Mathias", "Holst", -18, JobTypes.Fireman);
            Assert.That(testPersonen.GetAge() == 0);
        }

        [Test()]
        public void HappyBirthdayTest()
        {
            Person testPersonen = new Person("Mathias", "Holst", 18, JobTypes.Policeman);
            int alder = testPersonen.GetAge();
            testPersonen.HappyBirthday();
            Assert.That(testPersonen.GetAge() == alder+1);
        }
    }
}