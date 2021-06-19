//
//  MakeBookingView.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI

struct MakeBookingTemplate: View {
    @State var selectedTab = "MakeBooking"
    
    @StateObject var viewModel = CreateBookingViewModel()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State private var bookingDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    

    
    var dropdownList: some View {
        
        Group {
            DropdownView(viewModel: $viewModel.locationDropdown)
            DropdownView(viewModel: $viewModel.peopleDropdown)
        }
//        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
//            DropdownView(viewModel: $viewModel.dropdowns[index])
//        }
        
    }
    
    var mainContentView: some View {
        ScrollView{
            VStack{
                
                DatePicker(selection: $bookingDate, in: Date()..., displayedComponents: .date) {
                    Text("Select a date")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding()
                Spacer()
                
                DatePicker(selection: $startTime, in: Date()..., displayedComponents: .hourAndMinute) {
                    Text("Select a start time")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding()
                Spacer()
                
                DatePicker(selection: $endTime, in: Date()..., displayedComponents: .hourAndMinute) {
                    Text("Select an end time")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding()
                Spacer()
                
                
                dropdownList
                Spacer()
                Button(action: {
                    viewModel.send(action: .createBooking)
                }) {
                    Text("Submit")
                        .font(.system(size: 24, weight: .medium))
                }
                
            }
        }
       
        .navigationBarTitle("Make a Booking")
        .navigationBarBackButtonHidden(true)
        .padding(.bottom, 15)
    }
    
    var body: some View {
        ZStack{
        if viewModel.isLoading {
            ProgressView()
        } else {
            mainContentView
        }
        }.alert(isPresented: Binding<Bool>.constant($viewModel.error.wrappedValue != nil) {
            Alert(title: Text("Error"), message: Text($viewModel.error.wrappedValue?.localizedDescription ?? ""), dismissButton: Alert.Button?)
        })
        .navigationBarTitle("Make a booking")
        .navigationBarBackButtonHidden(true)
        .padding(.bottom, 15)
    }
}


struct MakeBookingTemplate_Previews: PreviewProvider {
    static var previews: some View {
        MakeBookingTemplate()
    }
}
