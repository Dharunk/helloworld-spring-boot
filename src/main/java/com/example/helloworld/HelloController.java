package com.example.helloworld;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String sayHello() {
        return "Hello, World!!!";
    }

    @GetMapping("/hi")
    public String sayHi() {
        return "Hi everyone, I'm Dharunkumar";
    }
}
