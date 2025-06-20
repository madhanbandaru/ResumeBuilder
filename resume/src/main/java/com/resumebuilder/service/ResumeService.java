package com.resumebuilder.service;

import com.resumebuilder.model.Resume;
import com.resumebuilder.model.User;
import com.resumebuilder.repository.ResumeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ResumeService {
    
    @Autowired
    private ResumeRepository resumeRepository;
    
    public Resume saveResume(Resume resume) {
        return resumeRepository.save(resume);
    }
    
    public List<Resume> getUserResumes(User user) {
        return resumeRepository.findByUserOrderByUpdatedAtDesc(user);
    }
    
    public Resume getResumeById(Long id) {
        return resumeRepository.findById(id).orElse(null);
    }
    
    public void deleteResume(Long id) {
        resumeRepository.deleteById(id);
    }
}