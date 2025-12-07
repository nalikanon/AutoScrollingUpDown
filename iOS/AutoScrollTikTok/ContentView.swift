//
//  ContentView.swift
//  AutoScrollTikTok
//
//  Main view for Auto Scrolling TikTok
//

import SwiftUI

struct ContentView: View {
    @StateObject private var scrollController = ScrollController()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "arrow.up.arrow.down.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                    
                    Text("Auto Scroll TikTok")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.top, 40)
                
                // Status
                VStack(spacing: 15) {
                    if scrollController.isRunning {
                        HStack {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 12, height: 12)
                            Text("กำลังทำงาน")
                                .font(.headline)
                                .foregroundColor(.green)
                        }
                    } else {
                        HStack {
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 12, height: 12)
                            Text("หยุดทำงาน")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    if scrollController.loopCount > 0 {
                        Text("ลูปที่: \(scrollController.loopCount)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Control Buttons
                VStack(spacing: 20) {
                    if scrollController.isRunning {
                        Button(action: {
                            scrollController.stop()
                        }) {
                            HStack {
                                Image(systemName: "stop.circle.fill")
                                Text("หยุด")
                            }
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(15)
                        }
                    } else {
                        Button(action: {
                            scrollController.start()
                        }) {
                            HStack {
                                Image(systemName: "play.circle.fill")
                                Text("เริ่ม")
                            }
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(15)
                        }
                    }
                }
                .padding(.horizontal, 40)
                
                // Settings
                VStack(alignment: .leading, spacing: 15) {
                    Text("การตั้งค่า")
                        .font(.headline)
                        .padding(.horizontal, 40)
                    
                    VStack(spacing: 12) {
                        HStack {
                            Text("หน่วงเวลาระหว่างเลื่อน:")
                            Spacer()
                            Text("\(Int(scrollController.scrollDelay)) วินาที")
                                .foregroundColor(.secondary)
                        }
                        
                        Slider(value: $scrollController.scrollDelay, in: 0.5...3.0, step: 0.5)
                    }
                    .padding(.horizontal, 40)
                    
                    Text("⚡ ไม่มีพักเบรก - เลื่อนต่อเนื่อง")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 40)
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Instructions
                VStack(spacing: 10) {
                    Text("📱 วิธีใช้งาน:")
                        .font(.headline)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. เปิด TikTok ให้พร้อม")
                        Text("2. กดปุ่ม 'เริ่ม'")
                        Text("3. แอปจะเลื่อนขึ้น-ลงอัตโนมัติ")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

