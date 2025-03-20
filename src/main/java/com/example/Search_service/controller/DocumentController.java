package com.example.Search_service.controller;

import com.example.Search_service.entity.Document; // Correction ici
import com.example.Search_service.service.DocumentService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/documents")
@RequiredArgsConstructor
public class DocumentController {
    @Autowired
    private DocumentService documentService;

    @GetMapping("/search")
    public List<Document> search(@RequestParam String query) { // Correction ici
        return documentService.searchDocuments(query); // Correction ici
    }
}