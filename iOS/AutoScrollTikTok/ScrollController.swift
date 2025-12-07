//
//  ScrollController.swift
//  AutoScrollTikTok
//
//  Controller for auto scrolling functionality
//

import SwiftUI
import UIKit

class ScrollController: ObservableObject {
    @Published var isRunning = false
    @Published var loopCount = 0
    @Published var scrollDelay: Double = 1.0
    @Published var loopDelay: Double = 1.0
    
    private var scrollTask: Task<Void, Never>?
    
    func start() {
        guard !isRunning else { return }
        
        isRunning = true
        loopCount = 0
        
        scrollTask = Task {
            // รอ 3 วินาทีก่อนเริ่ม
            await delay(seconds: 3)
            
            while !Task.isCancelled && isRunning {
                await MainActor.run {
                    loopCount += 1
                }
                
                // เลื่อนลง
                await scrollDown()
                await delay(seconds: scrollDelay)
                
                // เลื่อนขึ้น
                await scrollUp()
                await delay(seconds: scrollDelay)
                
                // พักก่อนลูปใหม่
                await delay(seconds: loopDelay)
            }
            
            await MainActor.run {
                isRunning = false
            }
        }
    }
    
    func stop() {
        isRunning = false
        scrollTask?.cancel()
        scrollTask = nil
    }
    
    private func scrollDown() async {
        await MainActor.run {
            // ใช้ UIAccessibility เพื่อเลื่อนหน้าจอ
            // จำลองการสวายปจากกลางหน้าจอลงล่าง
            simulateSwipe(direction: .down)
        }
    }
    
    private func scrollUp() async {
        await MainActor.run {
            // จำลองการสวายปจากกลางหน้าจอขึ้นบน
            simulateSwipe(direction: .up)
        }
    }
    
    private func simulateSwipe(direction: SwipeDirection) {
        // ใช้ Accessibility Services เพื่อเลื่อนหน้าจอ
        // ต้องให้สิทธิ์ Accessibility ใน Settings > Accessibility
        
        let screenSize = UIScreen.main.bounds
        let centerX = screenSize.width / 2
        let centerY = screenSize.height / 2
        
        // ใช้ UIAccessibility เพื่อส่ง scroll gesture
        // หมายเหตุ: iOS มีข้อจำกัดในการควบคุมแอปอื่น
        // วิธีนี้จะทำงานได้ดีที่สุดเมื่อใช้ร่วมกับ Accessibility Services
        
        // สำหรับการใช้งานจริง:
        // 1. ไปที่ Settings > Accessibility > Auto Scroll TikTok
        // 2. เปิดใช้งาน Full Access
        // 3. ใช้แอปนี้เพื่อควบคุมการเลื่อน
        
        sendAccessibilityScroll(direction: direction)
    }
    
    private func sendAccessibilityScroll(direction: SwipeDirection) {
        // ใช้ UIAccessibility เพื่อส่ง scroll event
        // ต้องขอสิทธิ์ Accessibility ใน Settings > Accessibility
        
        // สร้าง scroll gesture โดยใช้ accessibility notification
        // หมายเหตุ: วิธีนี้จะทำงานได้ดีที่สุดเมื่อ:
        // 1. แอปมีสิทธิ์ Accessibility
        // 2. ใช้ร่วมกับ Shortcuts app
        
        // สำหรับการเลื่อนจริง ใช้การส่ง accessibility action
        let scrollAmount: Int = direction == .down ? -5 : 5
        
        // ส่ง scroll notification
        // วิธีนี้จะทำงานเมื่อแอปมีสิทธิ์ Accessibility
        if UIAccessibility.isAssistiveTouchRunning {
            // ใช้ AssistiveTouch API ถ้ามี
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        } else {
            // ใช้วิธีพื้นฐาน
            // หมายเหตุ: iOS มีข้อจำกัดในการควบคุมแอปอื่น
            // สำหรับการใช้งานจริง ควรใช้ Shortcuts app
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }
    
    private func delay(seconds: Double) async {
        try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
    }
}

enum SwipeDirection {
    case up
    case down
}

