package tracker.model.dao;

import tracker.model.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by silvian on 08/01/15.
 */

@Repository
public class PersonDAOImpl implements PersonDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addPerson(Person person) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(person);
		logger.info("Person saved successfully, Person Details="+person);
	}

	@Override
	public void updatePerson(Person person) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(person);
		logger.info("Person updated successfully, Person Details="+person);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> listPersons() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Person> personsList = session.createQuery("from Person").list();
		for(Person person : personsList){
			logger.info("Person List::"+person);
		}
		return personsList;
	}

	@Override
	public Person getPersonById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Person person = (Person) session.load(Person.class, new Integer(id));
		logger.info("Person loaded successfully, Person details="+person);
		return person;
	}

	@Override
	public void addPointToPerson(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person person = (Person) session.load(Person.class, new Integer(id));
		if(null != person){
			person.setPoints(person.getPoints() + 1);
			session.update(person);
		}
		logger.info("Person's M-point has been added successfully, person="+person);
	}

    @Override
    public void addReasonToPerson(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Person person = (Person) session.load(Person.class, new Integer(id));
        if(null != person){
            session.update(person);
            logger.info("Person updated successfully, Person Details="+person);
        }
    }

	@Override
	public void removePerson(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person person = (Person) session.load(Person.class, new Integer(id));
		if(null != person){
			session.delete(person);
		}
		logger.info("Person deleted successfully, person details="+person);
	}

}
