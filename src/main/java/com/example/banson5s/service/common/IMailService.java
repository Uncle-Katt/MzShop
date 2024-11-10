package com.example.banson5s.service.common;

import com.example.banson5s.dto.admin.mail.MailDTO;
import com.example.banson5s.dto.admin.mail.MailInputDTO;
import jakarta.mail.MessagingException;

public interface IMailService {

    void sendHtmlMail(MailDTO dataMail) throws MessagingException;

    Boolean create(MailInputDTO sdi);
}
