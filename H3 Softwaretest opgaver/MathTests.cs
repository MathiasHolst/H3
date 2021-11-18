using NUnit.Framework;
using softwaretest;
using System;
using System.Collections.Generic;
using System.Text;

namespace softwaretest.Tests
{
    [TestFixture()]
    public class MathTests
    {
        [Test()]
        public void AddTest()
        {
            int result = new Math().Add(50, 36);
            int expected = 86;

            Assert.That(result == expected);
        }

        [Test()]
        public void AtleastOneTest()
        {
            int result = new Math().Add(50, 36);
            int expected = 1;

            Assert.That(result, Is.AtLeast(expected));
        }
    }
}