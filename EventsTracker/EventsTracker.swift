//
//  DateTrackerApp.swift
//  DateTracker
//
//  Created by @Benv_dev on 8/8/22.
//

import SwiftUI

@main
struct EventsTracker: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            EventTrackerTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
