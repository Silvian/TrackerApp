package tracker.model.dao;

import tracker.model.Person;
import java.util.List;

/**
 * Created by silvian on 08/01/15.
 */

public interface PersonDAO {

	public void addPerson(Person person);
	public void updatePerson(Person person);
	public List<Person> listPersons();
	public Person getPersonById(int id);
    public void addReasonToPerson(int id);
	public void addPointToPerson(int id);
	public void removePerson(int id);
}
