package com.resumebuilder.controller;

import com.resumebuilder.model.Resume;
import com.resumebuilder.model.User;
import com.resumebuilder.service.ResumeService;
import com.resumebuilder.service.UserService;
import com.resumebuilder.service.PDFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ResumeController {
    
    @Autowired
    private ResumeService resumeService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private PDFService pdfService;
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return "redirect:/login";
        }
        
        User user = userService.findByEmail(userEmail);
        List<Resume> resumes = resumeService.getUserResumes(user);
        
        model.addAttribute("user", user);
        model.addAttribute("resumes", resumes);
        
        return "dashboard";
    }
    
    @GetMapping("/create-resume")
    public String createResumePage(HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return "redirect:/login";
        }
        
        model.addAttribute("resume", new Resume());
        return "create-resume";
    }
    
    @PostMapping("/create-resume")
    public String createResume(@ModelAttribute Resume resume,
                              @RequestParam String template,
                              HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return "redirect:/login";
        }
        
        User user = userService.findByEmail(userEmail);
        resume.setUser(user);
        resume.setTemplate(template);
        
        resumeService.saveResume(resume);
        
        return "redirect:/dashboard";
    }
    
    @GetMapping("/edit-resume/{id}")
    public String editResumePage(@PathVariable Long id, HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return "redirect:/login";
        }
        
        Resume resume = resumeService.getResumeById(id);
        if (resume == null || !resume.getUser().getEmail().equals(userEmail)) {
            return "redirect:/dashboard";
        }
        
        model.addAttribute("resume", resume);
        return "edit-resume";
    }
    
    @PostMapping("/edit-resume/{id}")
    public String editResume(@PathVariable Long id,
                            @ModelAttribute Resume resumeForm,
                            @RequestParam String template,
                            HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return "redirect:/login";
        }
        
        Resume resume = resumeService.getResumeById(id);
        if (resume == null || !resume.getUser().getEmail().equals(userEmail)) {
            return "redirect:/dashboard";
        }
        
        // Update resume fields
        resume.setFullName(resumeForm.getFullName());
        resume.setPhone(resumeForm.getPhone());
        resume.setEmail(resumeForm.getEmail());
        resume.setAddress(resumeForm.getAddress());
        resume.setCareerObjective(resumeForm.getCareerObjective());
        resume.setEducation(resumeForm.getEducation());
        resume.setExperience(resumeForm.getExperience());
        resume.setSkills(resumeForm.getSkills());
        resume.setAchievements(resumeForm.getAchievements());
        resume.setTemplate(template);
        
        resumeService.saveResume(resume);
        
        return "redirect:/preview-resume/" + id;
    }
    
    @GetMapping("/preview-resume/{id}")
    public String previewResume(@PathVariable Long id, HttpSession session, Model model) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return "redirect:/login";
        }
        
        Resume resume = resumeService.getResumeById(id);
        if (resume == null || !resume.getUser().getEmail().equals(userEmail)) {
            return "redirect:/dashboard";
        }
        
        model.addAttribute("resume", resume);
        return "preview-resume";
    }
    
    @GetMapping("/download-resume/{id}")
    public ResponseEntity<byte[]> downloadResume(@PathVariable Long id, HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return ResponseEntity.status(401).build();
        }
        
        Resume resume = resumeService.getResumeById(id);
        if (resume == null || !resume.getUser().getEmail().equals(userEmail)) {
            return ResponseEntity.status(403).build();
        }
        
        byte[] pdfBytes = pdfService.generatePDF(resume);
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDispositionFormData("attachment", resume.getFullName() + "_Resume.pdf");
        
        return ResponseEntity.ok()
                .headers(headers)
                .body(pdfBytes);
    }
    
    @GetMapping("/delete-resume/{id}")
    public String deleteResume(@PathVariable Long id, HttpSession session) {
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            return "redirect:/login";
        }
        
        Resume resume = resumeService.getResumeById(id);
        if (resume != null && resume.getUser().getEmail().equals(userEmail)) {
            resumeService.deleteResume(id);
        }
        
        return "redirect:/dashboard";
    }
}
