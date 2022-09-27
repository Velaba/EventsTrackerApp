//
//  EventTrackerTabView.swift
//  EventsTracker
//
//  Created by @Benv_dev on 8/8/22.
//

import SwiftUI

struct EventTrackerTabView: View {
    
    var body: some View {
            TabView {
                AddEventView()
                    .tabItem {
                        Image(systemName: "calendar.badge.plus")
                        Text("Add Events")
                    }
                EventDatesCollectionsView()
                    .tabItem {
                        Image(systemName: "list.dash.header.rectangle")
                        Text("Events List")
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
            .accentColor(Color("AppPrimary"))
            .navigationTitle("Event Tracker")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventTrackerTabView()
    }
}
