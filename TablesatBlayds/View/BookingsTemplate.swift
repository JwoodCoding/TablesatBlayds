//
//  BookingsTemplate.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI

struct BookingsTemplate: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Your upcoming bookings")
                .font(.title)
                .fontWeight(.semibold)
            
        }
        
        
    }
}

struct BookingsTemplate_Previews: PreviewProvider {
    static var previews: some View {
        BookingsTemplate()
    }
}
