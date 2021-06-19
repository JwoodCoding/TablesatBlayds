//
//  BookingListViewModel.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI
import Combine

final class BookingListViewModel : ObservableObject {
    private let userService: UserServiceProtocol
    private let bookingService: BookingServiceProtocol
    
    init(userService: UserServiceProtocol = UserService(),
         bookingService: BookingServiceProtocol = BookingService()
    ) {
        self.userService = userService
        self.bookingService = bookingService
    }
}
