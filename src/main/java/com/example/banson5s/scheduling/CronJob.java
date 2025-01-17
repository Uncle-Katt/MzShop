package com.example.banson5s.scheduling;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class CronJob {

    @Scheduled(fixedRate = 6000) // Chạy mỗi phút (1 phút = 60000 milliseconds)
    public void runJob() {
        System.out.println("Cron job đã chạy lúc: " + System.currentTimeMillis());
        // Thực hiện tác vụ bạn muốn ở đây
    }
}
