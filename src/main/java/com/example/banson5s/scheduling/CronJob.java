package com.example.banson5s.scheduling;

import com.example.banson5s.repository.admin.IPhieuGiamGiaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class CronJob {
    @Autowired
    IPhieuGiamGiaRepository phieuGiamGiaRepository;

    @Scheduled(fixedRate = 6000) // Chạy mỗi phút (1 phút = 60000 milliseconds)
    public void runJob() {
        System.out.println("Cron job đã chạy lúc: " + System.currentTimeMillis());
        // Thực hiện tác vụ bạn muốn ở đây
        LocalDateTime currentDateTime = LocalDateTime.now();
        phieuGiamGiaRepository.updateStatusToActive(currentDateTime);
        phieuGiamGiaRepository.updateStatusToExpired(currentDateTime);
    }
}
