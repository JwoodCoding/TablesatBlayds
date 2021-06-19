//
//  BookingListView.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

//import SwiftUI
//
//struct BookingListView: View {
//
//    @ObservedObject private var viewModel = bookingViewModel()
//
//
//    var body: some View {
//
//        NavigationView{
//            List(viewModel.bookings) { booking in
//                VStack(alignment: .leading){
//                    Text(booking.dateString).font(.title3)
//
//                }
//            }.navigationBarTitle("My Bookings")
//            
//            .onAppear() {
//                self.viewModel.fetchData()
//            }
//        }
//
//
//    }
//}
