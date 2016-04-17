package tracker.service;

import tracker.model.dao.PersonDAO;
import tracker.model.Person;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by silvian on 08/01/15.
 */

@Service
public class PersonServiceImpl implements PersonService {
	
	private PersonDAO personDAO;

	public void setPersonDAO(PersonDAO personDAO) {
		this.personDAO = personDAO;
	}

	@Override
	@Transactional
	public void addPerson(Person person) {
		this.personDAO.addPerson(person);
	}

	@Override
	@Transactional
	public void updatePerson(Person person) {
		this.personDAO.updatePerson(person);
	}

	@Override
	@Transactional
	public List<Person> listPersons() {
		return this.personDAO.listPersons();
	}

	@Override
	@Transactional
	public Person getPersonById(int id) {
		return this.personDAO.getPersonById(id);
	}

    @Override
    @Transactional
    public void addReasonToPerson(int id) {
            this.personDAO.addReasonToPerson(id);
    }

    @Override
	@Transactional
	public void addPointToPerson(int id) {
		this.personDAO.addPointToPerson(id);
	}

	@Override
	@Transactional
	public void removePerson(int id) {
		this.personDAO.removePerson(id);
	}

}
