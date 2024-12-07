package com.haui.elearning.dto;

import com.haui.elearning.service.validator.RegisterChecked;
import com.haui.elearning.service.validator.StrongPassword;
import jakarta.validation.constraints.NotEmpty;

@RegisterChecked
public class RegisterDTO {
    @NotEmpty(message = "Username cannot be empty")
    private String username;

    @NotEmpty(message = "Email cannot be empty")
    private String email;

    @StrongPassword(message = "Must be 8 characters long and combination of uppercase letters, lowercase letters, numbers, special characters.")
    @NotEmpty(message = "Password cannot be empty")
    private String password;

    @NotEmpty(message = "Confirm Password cannot be empty")
    private String confirmPassword;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
