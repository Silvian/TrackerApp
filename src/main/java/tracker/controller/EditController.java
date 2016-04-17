package tracker.controller;

import tracker.model.Person;
import tracker.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EditController {

	private PersonService personService;

	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService personServices){
		this.personService = personServices;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.personService.listPersons());
		return "edit";
	}

	//For add and update person
	@RequestMapping(value= "/edit/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person person){

		if(person.getId() == 0){
			//new person, add it
			this.personService.addPerson(person);
		}else{
			//existing person, call update
			this.personService.updatePerson(person);
		}

		return "redirect:/edit";
	}

	@RequestMapping("/remove/{id}")
	public String removePerson(@PathVariable("id") int id){
		this.personService.removePerson(id);
		return "redirect:/edit";
	}

	@RequestMapping("/edit/{id}")
	public String editPerson(@PathVariable("id") int id, Model model){
		model.addAttribute("person", this.personService.getPersonById(id));
		model.addAttribute("listPersons", this.personService.listPersons());
		return "edit";
	}

}
