//
//  EventDetailView.swift
//  EventsTracker
//
//  Created by Ben Vela on 8/24/22.
//

import SwiftUI

struct EventDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: EventItem.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "creationDate",
                                                     ascending: false)]) private var allEvents: FetchedResults<EventItem>
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Event.title")
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
