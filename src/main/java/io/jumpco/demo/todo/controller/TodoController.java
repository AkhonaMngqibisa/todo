package io.jumpco.demo.todo.controller;

import io.jumpco.demo.todo.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.*;

@Controller
public class TodoController {
    private TodoService todoService;

    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @RequestMapping("/todo/create")
    public ModelAndView startCreate() {
        ModelAndView result = new ModelAndView("add-edit");
        result.addObject("mode", "add");
        result.addObject("modeTitle", "Create");
        result.addObject("todo", new Todo());
        return result;
    }

    @GetMapping("/todo/edit/{id}")
    public ModelAndView startEdit(@PathVariable("id") Long id) throws EntityNotFoundException {
        Todo item = todoService.find(id);
        ModelAndView result = new ModelAndView("add-edit");
        result.addObject("mode", "update");
        result.addObject("modeTitle", "Update");
        result.addObject("todo", item);
        return result;
    }

    @PostMapping(params = "cancel", path = "/todo/add")
    public String cancelAdd() {
        return home();
    }

    @PostMapping(params = "cancel", path = "/todo/update")
    public String cancelUpdate() {
        return home();
    }

    @PostMapping("/todo/update")
    public ModelAndView update(@Valid @ModelAttribute Todo todo, BindingResult bindingResult, Model model) throws EntityNotFoundException {
        if (bindingResult.hasErrors()) {
            ModelAndView result = new ModelAndView("add-edit");
            result.addObject("mode", "update");
            result.addObject("modeTitle", "Update");
            result.addAllObjects(model.asMap());
            return result;
        }
        todoService.update(todo);
        return new ModelAndView(home());
    }

    @PostMapping("/todo/add")
    public ModelAndView create(@Valid @ModelAttribute Todo todo, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            ModelAndView result = new ModelAndView("add-edit");
            result.addObject("mode", "add");
            result.addObject("modeTitle", "Create");
            result.addAllObjects(model.asMap());
            return result;
        }
        todoService.create(todo);
        return new ModelAndView(home());
    }

    @GetMapping(value = "/todo/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        todoService.delete(id);
        return home();
    }

    @GetMapping(value = "/todo/complete/{id}")
    public String complete(@PathVariable("id") Long id) throws EntityNotFoundException {
        todoService.complete(id);
        return home();
    }

    private String home() {
        return "redirect:/";
    }

    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView result = new ModelAndView("index");
        result.addObject("todos", todoService.list(null));
        return result;
    }
//-------------------------------------------

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() {
        Todo add = new Todo();

        ModelAndView modelAndView = new ModelAndView("index", "command", add);
        return modelAndView;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@ModelAttribute("SpringWeb")Todo add, ModelMap model)
    {

        model.addAttribute("options", add.getOptions());
        model.addAttribute("KB", add.getKB());

        return "index";
    }


    @ModelAttribute("optionsList")
    public Map<String, String> getOptionsList() {
        Map<String, String> optionsList = new HashMap<String, String>();
        optionsList.put("B","Bug");
        optionsList.put("Enh", "Enhancement");
        optionsList.put("M", "Maintenance");
        optionsList.put("T", "Task");
        optionsList.put("Fe","Feature");
        return optionsList;
    }

    //-------------------------------------------KB List

    @ModelAttribute("KBList")
    public Map<String, String> getKBList() {
        Map<String, String> KBList = new HashMap<String, String>();
        KBList.put("T","Todo");
        KBList.put("InP", "In Progress");
        KBList.put("D", "Done");

        return KBList;
    }


}
