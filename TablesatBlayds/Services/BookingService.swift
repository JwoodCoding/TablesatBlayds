//
//  BookingService.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol BookingServiceProtocol {
    func create(_ booking: Booking) -> AnyPublisher<Void, Error>
}

final class BookingService: BookingServiceProtocol {
    private let db = Firestore.firestore()
    
    func create(_ booking: Booking) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            do {
                _ = try self.db.collection("bookings").addDocument(from: booking) { error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}
