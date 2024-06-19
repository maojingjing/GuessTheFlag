//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jingjing Mao on 6/6/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Button("Show alert") {
                showingAlert = true
            }
            .alert("Important Message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Please read this")
            }
            
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(
                    options: [.alert, .badge, .sound]) { success, error in
                        if success{
                            print("All set!")
                        } else if let error {
                            print(error.localizedDescription)
                        }
                }
                
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
                
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
