//
//  CreateBookingViewModel.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI
import Firebase
import Combine
import FirebaseFirestoreSwift
import FirebaseFirestore

typealias UserId = String


final class CreateBookingViewModel: ObservableObject {

    
    @Published var locationDropdown = BookingPartViewModel(type: .location)
    @Published var peopleDropdown = BookingPartViewModel(type: .people)
   
    
    @Published var isLoading = false
    
    
    private let userService: UserServiceProtocol
    private let bookingService: BookingServiceProtocol
    private var cancellables: [AnyCancellable] = []
    
    enum Action {
        
        case createBooking
    }
    
   
    

    
    init(userService: UserServiceProtocol = UserService(), bookingService: BookingServiceProtocol = BookingService()) {
        self.userService = userService
        self.bookingService = bookingService
    }
    
    func send(action: Action) {
        switch action {
        
        case .createBooking:
            isLoading = true
            currentUserId().flatMap { userId -> AnyPublisher<Void, Error> in
                return self.createBooking(userId: userId)
            }.sink { completion in
                self.isLoading = false
                switch completion {
                case let .failure(error):
                    print(error.localizedDescription)
                    
                case .finished:
                    print("finished")
                }
            } receiveValue: { _ in
                print("success")
            }.store(in: &cancellables)
        }
    }
    

    private func createBooking(userId: UserId) -> AnyPublisher<Void, Error> {
        guard let location = locationDropdown.text,
              let people = peopleDropdown.number else {
            return Fail(error: NSError()).eraseToAnyPublisher()
        }
        
        let booking = Booking(name: name, bookingDate: bookingDate, endTime: endTime, location: location, people: people, userId: UserId)
        
        return bookingService.create(booking).eraseToAnyPublisher()
    }
    
    private func currentUserId() -> AnyPublisher<UserId, Error> {
        print("getting user id")
        return userService.currentUser().flatMap { user -> AnyPublisher<UserId, Error>
            in
            if let userId = user?.uid {
                print("user is logged in...")
                return Just(userId)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } else {
                print("user is being logged in anonymously...")
                return self.userService
                    .signInAnonymously()
                    .map { $0.uid }
                    .eraseToAnyPublisher()
            }
            
        }.eraseToAnyPublisher()
    }
}
    


extension CreateBookingViewModel {
    struct BookingPartViewModel: DropdownItemProtocol {
        var selectedOption: DropdownOption
        
        
        var options: [DropdownOption]
        
        var headerTitle: String {
            type.rawValue
        }
        
        var dropdownTitle: String {
            selectedOption.formatted
        }
        
        var isSelected: Bool = false
        private let type: BookingPartType
        
        init(type: BookingPartType) {
            
            switch type {
            case .location:
                self.options = LocationOption.allCases.map { $0.toDropdownOption}
            case .people:
                self.options = PeopleOption.allCases.map {$0.toDropdownOption}
            
            }
            self.type = type
            self.selectedOption = options.first!
            
            
        }
        
        enum BookingPartType: String, CaseIterable {
            case location = "Location"
            case people = "Number of People"
            
           
        }
        
        enum LocationOption: String, CaseIterable, DropdownOptionProtocol {
            case indoors
            case outdoors
            case upstairs
            
            var toDropdownOption: DropdownOption {
                .init(type: .text(rawValue),
                      formatted: rawValue.capitalized
                      
                )
            }
        }
        
        enum PeopleOption: Int, CaseIterable, DropdownOptionProtocol {
            case one = 1, two, three, four, five
            case outdoors
            case upstairs
            
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue),
                      formatted: "\(rawValue)"
                      
                )
            }
        }
        
    }
}

extension CreateBookingViewModel.BookingPartViewModel {
    var text: String? {
        if case let .text(text) = selectedOption.type {
            return text
        }
        return nil
    }
    
    var number: Int? {
        if case let .number(number) = selectedOption.type {
            return number
        }
        return nil
    }
}
