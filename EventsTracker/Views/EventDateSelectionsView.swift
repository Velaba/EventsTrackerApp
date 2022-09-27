//
//  EventDateSelectionsView.swift
//  EventsTracker
//
//  Created by @Benv_dev on 8/8/22.
//

import SwiftUI

struct EventDateSelectionsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    @State private var startDate = Date()
    @State private var selectedDate = Date()
    
    private func saveEvent() {
        
        do {
            let event = EventItem(context: viewContext)
            event.title = textFieldText
            event.creationDate = Date()
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Add a title for your event...", text: $textFieldText)
                            .frame(height: 30)
                            .opacity(0.75)
                            .cornerRadius(10)
                            .shadow(radius: 25)
                    }
                header: {
                    Text("Event Title")
                        .foregroundColor(Color("AppPrimary"))
                }
                    Section {
                        HStack {
                            EventDatePickerView(calendarImageName: "calendar.badge.plus")
                            DatePicker(selection: $startDate,
                                       displayedComponents: .date,
                                       label: {
                                Text("Start Date:")
                            })
                        }
                        .accentColor(Color("AppPrimary"))
                    }
                header: {
                    Text("Select a Start Date")
                        .foregroundColor(Color("AppPrimary"))
                }
                    Section {
                        HStack {
                            EventDatePickerView(calendarImageName: "calendar.badge.exclamationmark")
                            DatePicker("Event Date:",
                                       selection: $selectedDate,
                                       displayedComponents: [.date])
                        }
                        .accentColor(Color("AppPrimary"))
                    }
                header: {
                    Text("Select the date of your event")
                        .foregroundColor(Color("AppPrimary"))
//                }
//                    Section {
//                        Button("Save Event") {
//                            saveEvent()
//                        }
                        .foregroundColor(Color("BackgroundSecondary"))
                        .fontWeight(.semibold)
                        .accentColor(Color("AppPrimary"))
                        .navigationTitle("Event Date Selection")
                        .navigationBarItems(trailing:
                                                Button("Done") {
                            saveEvent()
//                            numberOfDays
                            dismiss()
                        })
                        .foregroundColor(Color("BackgroundSecondary"))
                        .fontWeight(.semibold)
                    }
                }
//                                .scrollContentBackground(.hidden)
//                                .foregroundColor(Color("AppPrimary"))
//                                .background(Color("BackgroundSecondary"))
            }
        }
    }
}
extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day! + 1 //n<1>
    }
}

struct DateSelectionsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDateSelectionsView()
    }
}

struct EventDatePickerView: View {
    var calendarImageName: String
    
    var body: some View {
        Image(systemName: calendarImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
    }
}
