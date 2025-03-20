package com.example.Search_service.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.example.Search_service.entity.Document;

@Service
public class DocumentService {

    private final RestTemplate restTemplate;

    public DocumentService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public List<Document> searchDocuments(String query) {
        String url = "http://localhost:2005/api/file/api/documents/search?query=" + query;
        Document[] documents = restTemplate.getForObject(url, Document[].class);
        return Arrays.asList(documents);
    }
}