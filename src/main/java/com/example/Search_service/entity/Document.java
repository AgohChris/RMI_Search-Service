package com.example.Search_service.entity;

import lombok.Data;

@Data
public class Document {
    private Long id;
    private String title;
    private String content;
    private String author;

    public Document() {}

    public Document(Long id, String title, String content, String author) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
    }
}