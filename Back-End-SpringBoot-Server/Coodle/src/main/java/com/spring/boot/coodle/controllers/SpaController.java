package com.spring.boot.coodle.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpaController {
    @RequestMapping({"/{path:[^\\.]*}", "/register-update-trainer/{id}"})
    public String forward() {
        return "forward:/index.html";
    }
}