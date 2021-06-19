////
////  BookingViewModel.swift
////  TablesatBlayds
////
////  Created by James Woodward on 18/06/2021.
////
//
//import Foundation
//import Combine
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//class bookingViewModel: ObservableObject {
//    
//    @Published var bookings = [Booking]()
//
//    private var db = Firestore.firestore()
//
//    func fetchData() {
//        db.collection("booking").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("no documents")
//                return
//            }
//
//            self.bookings = documents.map { (queryDocumentSnapshot) -> Booking in
//                let data = queryDocumentSnapshot.data()
//                let name = data["name"] as? String ?? ""
//                let bookingDate = (data["date"] as? Timestamp)?.dateValue() ?? Date()
//                let endTime = (data["endtime"] as? Timestamp)?.dateValue() ?? Date()
//                let location = data["location"] as? String ?? ""
//                let people = data["people"] as? Int ?? 0
//
//                return Booking(name: name, bookingDate: bookingDate, endTime: endTime, location: location, people: people)
//
//            }
//        }
//    }
//
//    func create(_ booking: Booking) -> AnyPublisher<Void, Error> {
//        return Future<Void, Error> { promise in
//            do {
//                _ = try self.db.collection("Bookings").addDocument(from: booking)
//                promise(.success(()))
//            } catch {
//                promise(.failure(error))
//            }
//        }.eraseToAnyPublisher()
//    }
//}
