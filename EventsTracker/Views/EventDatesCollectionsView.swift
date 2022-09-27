//
//  EventDatesCollectionsView.swift
//  EventsTracker
//
//  Created by @Benv_dev on 8/8/22.
//

import SwiftUI

struct EventDatesCollectionsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: EventItem.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "creationDate",
                                                     ascending: false)]) private var allEvents: FetchedResults<EventItem>
    
    private func deleteEvent(at offsets: IndexSet) {
        offsets.forEach { index in
            let event = allEvents[index]
            viewContext.delete(event)
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    private func updateEvent(_ event: EventItem) {
        event.isFavorite.toggle()
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
                List {
                    ForEach(allEvents) { event in
                        HStack {
                            Spacer().frame(width: 20)
                            Text(event.title ?? "")
                                .foregroundColor(Color("AppPrimary"))
                                .font(.subheadline)
                                .fontWeight(.light)
                                .padding(.vertical, 5)
                            Spacer()
                            Image(systemName: event.isFavorite ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    updateEvent(event)
                                }
                        }
                    }
                    .onDelete(perform: deleteEvent)
                }
                .listStyle(.plain)
                .cornerRadius(8)
                .navigationTitle("Upcoming Events")
                
            }
        }
    }
    
    struct DatesCollectionsView_Previews: PreviewProvider {
        static var previews: some View {
            EventDatesCollectionsView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

        }
    }
}
