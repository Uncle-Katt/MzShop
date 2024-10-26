package com.example.banson5s.exception;

import com.example.banson5s.dto.ResponseObject;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(value = Exception.class)
    ResponseEntity<ResponseObject> handlingRuntimeException(RuntimeException exception) {
        ResponseObject responseObject = ResponseObject.builder()
                .errCode(ErrorCode.UNCATEGORIZED_EXCEPTION.getCode())
                .message(ErrorCode.UNCATEGORIZED_EXCEPTION.getMessage())
                .build();
        return ResponseEntity.badRequest().body(responseObject);
    }
}
