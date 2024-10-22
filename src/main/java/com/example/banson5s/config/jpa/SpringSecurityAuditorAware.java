//package com.example.banson5s.config.jpa;
//
//import org.springframework.data.domain.AuditorAware;
//import org.springframework.data.domain.AuditorAware;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.stereotype.Component;
//import java.util.Optional;
//
//public class SpringSecurityAuditorAware  implements AuditorAware<String> {
//    @Override
//    public Optional<String> getCurrentAuditor() {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//
//        if (authentication == null || !authentication.isAuthenticated()) {
//            return Optional.of(GlobalEnum.AnomyousUser_String.toString());
//        }
//
//        String userId = getUserIdFromAuthentication(authentication);
//
//        return Optional.ofNullable(userId);
//    }
//
//    private String getUserIdFromAuthentication(Authentication authentication) {
//        Object principal = authentication.getPrincipal();
//        if (principal instanceof UserDetails) {
//            return ((UserDetails) principal).getUsername();
//        }
//        return "Anomyoususer";
//    }
//}
