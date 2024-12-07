package com.haui.elearning.controller.client;

import com.haui.elearning.entity.User;
import com.haui.elearning.service.UploadService;
import com.haui.elearning.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Objects;

@Controller
public class UserHomePageController {
    private final UserService userService;
    private final UploadService uploadService;

    public UserHomePageController(UserService userService, UploadService uploadService) {
        this.userService = userService;
        this.uploadService = uploadService;
    }


    @GetMapping("user/manage/{id}")
    public String manage(Model model, @PathVariable Long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "client/user/manage";
    }

    @PostMapping("client/user/manage")
    public String postUpdateUser(@ModelAttribute("newUser") User user,
                                 @RequestParam("file") MultipartFile file,
                                 HttpServletRequest request) {
        User currentUser = this.userService.getUserById(user.getId());
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");

        if (currentUser != null) {
            currentUser.setUsername(user.getUsername());
            currentUser.setPhoneNumber(user.getPhoneNumber());

            if (!avatar.isEmpty()) {
                currentUser.setAvatar(avatar);
            }

            this.userService.handleSaveUser(currentUser);

            // Cập nhật lại session
            currentUser = this.userService.getUserById(user.getId()); // Tải lại thông tin người dùng
            HttpSession session = request.getSession();
            session.setAttribute("username", currentUser.getUsername());
            session.setAttribute("avatar", currentUser.getAvatar());
            session.setAttribute("id", currentUser.getId());
        }

        return "redirect:/";
    }
}
