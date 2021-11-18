using System;

/* Classen Person herunder virker efter hensigten, så i SKAL IKKE ændre i den. 
 * I skal implementere følgende tests af classen "Person":
 *  - Test at "job" bliver sat til null når et ukendt job sættes med
 *    AssignNewJob
 *  - Test at "job" bliver sat til den korrekte værdi af JobTypes, når 
 *    AssignNewJob bliver kaldt med eks. "Comedian" som parameter
 *  - Test at GetFullName returnerer den korrekte sammensætning af firstName
 *    og last name
 *  - Test at hvis age bliver sat til mindre end 0, så bliver det automatisk
 *    sat tilbage til 0
 *  - Test at hver gang HappyBirthDay kaldes skal alder stige med præcis 1
 * 
 * Når i har fået godkendt jeres tests, skal i aflevere dem i en enkelt .cs fil
 */
public class Person
{
    string firstName;
    string lastName;
    int age;
    JobTypes? job; //Nullable 

    public Person(string firstName, string lastName, int age, JobTypes? job)
    {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        if (this.age < 0)
            this.age = 0;
        this.job = job;
    }

    public void AssignNewJob(string job) {
        try
        {
            this.job = (JobTypes) Enum.Parse(typeof(JobTypes), job);
        } catch (ArgumentException) {
            this.job = null;
        }
    }

    public string GetFullName() {
        return firstName + " " + lastName;
    }

    public int GetAge() {
        return age;
    }

    public JobTypes? GetJob() {
        return job;
    }

    public void HappyBirthday() {
        age += 1;
    }

    public static implicit operator string(Person v)
    {
        throw new NotImplementedException();
    }
}

public enum JobTypes 
{
    Teacher,
    Fireman,
    Policeman,
    Politician,
    Comedian,
    Mechanic,
    Programmer
}