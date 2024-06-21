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
            
            Button("show set result") {
                print("Best set " + (bestSet(setList: [SetDetail(lbs: 10, reps: 7), SetDetail(lbs: 15, reps: 2), SetDetail(lbs: 15, reps: 3)]) ?? "empty"))
            }
            
            Spacer()
            
            Image(.girlsRun).resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 100)
            
            Spacer()
            
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
    
    public func bestSet(setList: [SetDetail]) -> String? {
        if(setList.isEmpty) {
            return nil
        }
        var maxLbs = setList[0].lbs
        for setDetail in setList {
            if (setDetail.lbs > maxLbs) {
                maxLbs = setDetail.lbs
                print("maxLbs " + String(maxLbs))
            }
        }
        
        var maxSetList: [SetDetail] = []
        for setDetail in setList {
            if (setDetail.lbs == maxLbs) {
                maxSetList.append(setDetail)
            }
        }
        
        if (maxSetList.count <= 1) {
            return String(maxLbs) +  " X " + String(maxSetList[0].reps)
        }
        
        var maxReps = maxSetList[0].reps
        for setDetail in maxSetList {
            if (setDetail.reps > maxReps) {
                maxReps = setDetail.reps
                print("maxReps " + String(maxReps))
            }
        }
        
        return String(maxLbs) +  " X " + String(maxReps)
    }

}

#Preview {
    ContentView()
}
