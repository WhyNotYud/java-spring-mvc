package com.haui.elearning.service;

import com.haui.elearning.entity.Course;
import com.haui.elearning.repository.CourseRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {
    private final CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public void handleSaveCourse(Course course) {
        this.courseRepository.save(course);
    }

    public List<Course> getAllCourses() {
        return this.courseRepository.findAll();
    }

    public Course getCourseById(Long id) {
        return this.courseRepository.findById(id).orElse(null);
    }

    public void deleteCourseById(Long id) {
        this.courseRepository.deleteById(id);
    }
}
