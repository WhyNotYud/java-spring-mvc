package com.haui.elearning.controller.admin;

import com.haui.elearning.entity.Course;
import com.haui.elearning.service.CourseService;
import com.haui.elearning.service.UploadService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

@Controller
public class CourseController {
    private final UploadService uploadService;
    private final CourseService courseService;

    public CourseController(UploadService uploadService, CourseService courseService) {
        this.uploadService = uploadService;
        this.courseService = courseService;
    }


    @GetMapping("/admin/course/create")
    public String getCreateCourse(Model model) {
        model.addAttribute("newCourse", new Course());
        return "admin/course/create";
    }

    @PostMapping("/admin/course/create")
    public String postCreateCourse(@ModelAttribute("newCourse") @Valid Course course, BindingResult newCourseBindingResult, @RequestParam("file") MultipartFile file) {
        List<FieldError> errors = newCourseBindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.out.println (error.getField() + " - " + error.getDefaultMessage());
        }
        if(newCourseBindingResult.hasErrors()) {
            return "admin/course/create";
        }
        String image = this.uploadService.handleSaveUploadFile(file, "course");
        course.setImage(image);
        this.courseService.handleSaveCourse(course);
        return "redirect:/admin/course";
    }

    @GetMapping("/admin/course")
    public String getAllCourses(Model model) {
        List<Course> courses = this.courseService.getAllCourses();
        model.addAttribute("courses", courses);
        return "admin/course/show";
    }

    @GetMapping("/admin/course/{id}")
    public String getCourseById(Model model, @PathVariable Long id) {
        Course course = this.courseService.getCourseById(id);
        Instant createdAt = course.getCreatedAt();
        LocalDateTime localDateTime = LocalDateTime.ofInstant(createdAt, ZoneId.of("GMT+7"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");
        String formattedDate = localDateTime.format(formatter);
        model.addAttribute("course", course);
        model.addAttribute("createdAt", formattedDate);
        return "admin/course/detail";
    }

    // Delete Course
    @GetMapping("/admin/course/delete/{id}")
    public String deleteCourseById(Model model, @PathVariable Long id) {
        model.addAttribute("id", id);
        model.addAttribute("deleteCourse", new Course());
        return "admin/course/delete";
    }

    @PostMapping("/admin/course/delete")
    public String postDeleteCourse(@ModelAttribute("deleteCourse") Course course) {
        this.courseService.deleteCourseById(course.getId());
        return "redirect:/admin/course";
    }

    // Update Course
    @GetMapping("/admin/course/update/{id}")
    public String getUpdateCourseById(Model model, @PathVariable Long id) {
        Course currentCourse = this.courseService.getCourseById(id);
        model.addAttribute("newCourse", currentCourse);
        return "admin/course/update";
    }

    @PostMapping("admin/course/update")
    public String postUpdateCourse(@ModelAttribute("newCourse") Course course, @RequestParam("file") MultipartFile file) {
        Course currentCourse = this.courseService.getCourseById(course.getId());
        String image = this.uploadService.handleSaveUploadFile(file, "course");
        if (currentCourse != null) {
            currentCourse.setName(course.getName());
            currentCourse.setPrice(course.getPrice());
            currentCourse.setTitle(course.getTitle());
            currentCourse.setDescription(course.getDescription());
            currentCourse.setAuthor(course.getAuthor());
            currentCourse.setHour(course.getHour());
            if(!Objects.equals(image, "")) {
                currentCourse.setImage(image);
            }
            this.courseService.handleSaveCourse(currentCourse);
        }
        return "redirect:/admin/course";
    }
}

