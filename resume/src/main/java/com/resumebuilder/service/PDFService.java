package com.resumebuilder.service;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Text;
import com.resumebuilder.model.Resume;
import org.springframework.stereotype.Service;
import java.io.ByteArrayOutputStream;

@Service
public class PDFService {
    
    public byte[] generatePDF(Resume resume) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter writer = new PdfWriter(baos);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);
            
            // Header
            document.add(new Paragraph(resume.getFullName())
                .setFontSize(20)
                .setBold());
            
            document.add(new Paragraph(resume.getEmail() + " | " + resume.getPhone())
                .setFontSize(12));
            
            document.add(new Paragraph(resume.getAddress())
                .setFontSize(12));
            
            // Career Objective
            if (resume.getCareerObjective() != null && !resume.getCareerObjective().trim().isEmpty()) {
                document.add(new Paragraph("\nCAREER OBJECTIVE")
                    .setBold()
                    .setFontSize(14));
                document.add(new Paragraph(resume.getCareerObjective())
                    .setFontSize(11));
            }
            
            // Education
            if (resume.getEducation() != null && !resume.getEducation().trim().isEmpty()) {
                document.add(new Paragraph("\nEDUCATION")
                    .setBold()
                    .setFontSize(14));
                document.add(new Paragraph(resume.getEducation())
                    .setFontSize(11));
            }
            
            // Experience
            if (resume.getExperience() != null && !resume.getExperience().trim().isEmpty()) {
                document.add(new Paragraph("\nEXPERIENCE")
                    .setBold()
                    .setFontSize(14));
                document.add(new Paragraph(resume.getExperience())
                    .setFontSize(11));
            }
            
            // Skills
            if (resume.getSkills() != null && !resume.getSkills().trim().isEmpty()) {
                document.add(new Paragraph("\nSKILLS")
                    .setBold()
                    .setFontSize(14));
                document.add(new Paragraph(resume.getSkills())
                    .setFontSize(11));
            }
            
            // Achievements
            if (resume.getAchievements() != null && !resume.getAchievements().trim().isEmpty()) {
                document.add(new Paragraph("\nACHIEVEMENTS")
                    .setBold()
                    .setFontSize(14));
                document.add(new Paragraph(resume.getAchievements())
                    .setFontSize(11));
            }
            
            document.close();
            return baos.toByteArray();
        } catch (Exception e) {
            throw new RuntimeException("Error generating PDF", e);
        }
    }
}
