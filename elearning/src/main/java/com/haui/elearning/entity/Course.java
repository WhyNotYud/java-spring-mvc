package com.haui.elearning.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

import java.time.Instant;

@Entity
@Table(name = "courses")
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Name cannot be empty")
    private String name;

    @DecimalMin(inclusive = true, message = "Price must be greater or equal than 0", value = "0.0")
    private float price;
    private String image;

    @NotEmpty(message = "Author cannot be empty")
    private String author;
    @NotEmpty(message = "Title cannot be empty")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String title;
    @NotEmpty(message = "Description cannot be empty")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String description;
    private int sold;
    private int star;
    @DecimalMin(inclusive = false, message = "Hour must be greater than 0", value = "0.0")
    private float hour;
    private Instant createdAt;

    public Course() {
    }

    public Course(Long id, String name, float price, String image, String author, String title, String description, int sold, int star, float hour, Instant createdAt) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.author = author;
        this.title = title;
        this.description = description;
        this.sold = sold;
        this.star = star;
        this.hour = hour;
        this.createdAt = createdAt;
    }

    @PrePersist
    public void setValueBeforeCreate() {
        this.createdAt = Instant.now();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public float getHour() {
        return hour;
    }

    public void setHour(float hour) {
        this.hour = hour;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }
}
