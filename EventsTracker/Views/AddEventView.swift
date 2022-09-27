//
//  AddEventView.swift
//  EventsTracker
//
//  Created by @Benv_dev on 8/9/22.
//

import SwiftUI

struct AddEventView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("BackgroundSecondary").gradient)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Click the 'Add' Button to add to your list of events!" .uppercased())
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    Button("Add a New Event") {
                        showingSheet.toggle()
                    }
                    .foregroundColor(.white)
                    .font(.caption)
                    .padding()
                    .background(Color("AppPrimary"))
                    .cornerRadius(10)
                    .padding(.bottom)
                    .shadow(radius: 10)
                    .padding()
                    
                }
                .navigationTitle("Add New Events")
                
                .frame(width: 350, height: 150)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
            .padding()
            }
        }
        .sheet(isPresented: $showingSheet) {
            EventDateSelectionsView()
        }
    }
}

struct AddDateView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
    }
}
