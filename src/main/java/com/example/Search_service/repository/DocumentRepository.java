package com.example.Search_service.repository;

import com.example.Search_service.entity.Document;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DocumentRepository extends ElasticsearchRepository<Document, Long> {
    List<Document> findByTitleContainingOrContentContainingOrAuthorContaining(String title, String content, String author);
}