package com.haui.elearning.controller.client;

import com.haui.elearning.entity.Course;
import com.haui.elearning.service.CourseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@Controller
public class ItemController {
    private final CourseService courseService;

    public ItemController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping("/course/{id}")
    public String getProductPage(Model model, @PathVariable Long id) {
        Course course = this.courseService.getCourseById(id);
        Instant createdAt = course.getCreatedAt();
        LocalDateTime localDateTime = LocalDateTime.ofInstant(createdAt, ZoneId.of("GMT+7"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");
        String formattedDate = localDateTime.format(formatter);
        model.addAttribute("course", course);
        model.addAttribute("id", id);
        model.addAttribute("createdAt", formattedDate);
        return "client/course/detail";
    }

    @GetMapping("/course")
    public String getProductPage(Model model) {

        return "client/course/detail";
    }
}
