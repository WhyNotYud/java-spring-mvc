package com.haui.elearning.controller.admin;

import com.haui.elearning.entity.User;
import com.haui.elearning.service.UploadService;
import com.haui.elearning.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
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
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // Create New User
    @GetMapping("/admin/user/create")
    public String getCreateUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String postCreateUser(@ModelAttribute("newUser") @Valid User user
            , BindingResult newUserBindingResult
            ,@RequestParam("file") MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.out.println (error.getField() + " - " + error.getDefaultMessage());
        }
        if(newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setAvatar(avatar);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        user.setPassword(hashPassword);
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    // Get All User
    @GetMapping("/admin/user")
    public String getAllUsers(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }
    // Get User By ID
    @GetMapping("/admin/user/{id}")
    public String getUserById(Model model, @PathVariable Long id) {
        User user = this.userService.getUserById(id);
        Instant createdAt = user.getCreatedAt();
        LocalDateTime localDateTime = LocalDateTime.ofInstant(createdAt, ZoneId.of("GMT+7"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");
        String formattedDate = localDateTime.format(formatter);
        model.addAttribute("user", user);
        model.addAttribute("createdAt", formattedDate);
        return "admin/user/detail";
    }

    // Update User
    @GetMapping("admin/user/update/{id}")
    public String getUpdateUserById(Model model, @PathVariable Long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("admin/user/update")
    public String postUpdateUser(@ModelAttribute("newUser") User user, @RequestParam("file") MultipartFile file) {
        User currentUser = this.userService.getUserById(user.getId());
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        if (currentUser != null) {
            currentUser.setUsername(user.getUsername());
            currentUser.setPhoneNumber(user.getPhoneNumber());
            if(!Objects.equals(avatar, "")) {
                currentUser.setAvatar(avatar);
            }
            currentUser.setRole(this.userService.getRoleByName(user.getRole().getName()));
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // Delete User
    @GetMapping("/admin/user/delete/{id}")
    public String deleteUserById(Model model, @PathVariable Long id) {
        model.addAttribute("id", id);
        model.addAttribute("deleteUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(@ModelAttribute("deleteUser") User user) {
        this.userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
    }


    @GetMapping("/user")
    @ResponseBody
    public List<User> getAllUsers() {
        List<User> users = this.userService.getAllUsers();
        return users;
    }
}

