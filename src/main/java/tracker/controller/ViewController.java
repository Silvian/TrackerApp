package tracker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tracker.model.Person;
import tracker.service.PersonService;

/**
 * Created by silvian on 08/01/15.
 */

@Controller
public class ViewController {

    private PersonService personService;

    @Autowired(required=true)
    @Qualifier(value="personService")
    public void setPersonService(PersonService personServices){
        this.personService = personServices;
    }


    @RequestMapping(value = {"/", "/view"}, method = RequestMethod.GET)
    public String listPersons(Model model) {
        model.addAttribute("person", new Person());
        model.addAttribute("listPersons", this.personService.listPersons());
        return "view";
    }

    @RequestMapping("/add-point/{id}")
    public String addPoint(@PathVariable("id") int id){
        this.personService.addPointToPerson(id);
        return "redirect:/view";
    }

}
