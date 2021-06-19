//
//  Booking.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import Foundation




struct Booking: Codable{
    
    var dateString: String {

            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, dd 'of' MMMM"
            return formatter.string(from: bookingDate)
        }
    
    var timeString: String {

            let formatter = DateFormatter()
            formatter.dateFormat = "HH:MM"
            return formatter.string(from: endTime)
        }
    
//    var UserId: String = UUID().uuidString
//
//    var name: String
//
//    var bookingDate: Date
//
//    var dateString: String {
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "EEEE, dd 'of' MMMM"
//        return formatter.string(from: bookingDate)
//    }
//
//    var endTime: Date
//
//    var endTimeString: String{
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:MM"
//        return formatter.string(from: endTime)
//    }
//
//    var location: String
//
//    var people: Int
    let name: String
    let bookingDate: Date
    let endTime: Date
    let location: String
    let people: Int
    let userId: String
    
}

extension Booking : Equatable, Hashable {}
