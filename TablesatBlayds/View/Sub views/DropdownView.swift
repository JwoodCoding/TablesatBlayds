//
//  DropdownView.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI

struct DropdownView<T: DropdownItemProtocol>: View {
    @Binding var viewModel: T
    
    var actionSheet: ActionSheet {
        ActionSheet(
            title: Text("Select"),
            buttons: viewModel.options.map { option in
            
            return .default(
                Text(option.formatted)) {
                // select option at index
                viewModel.selectedOption = option
            }
        })
    }
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.headerTitle)
                    .font(.system(size: 19, weight: .semibold))
                
            }.padding(.vertical, 10)
            
            Button(action: {
                viewModel.isSelected = true
            }) {
                HStack{
                    Text(viewModel.dropdownTitle)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Image(systemName: "arrowtriangle.down.circle")
                        .font(.system(size: 20, weight: .medium))
                }
            }.buttonStyle(PrimaryButtonStyle(fillColor: .white))
        }
        .actionSheet(isPresented: $viewModel.isSelected) {
         
                        actionSheet
            
        }
        .padding(20)
    }
}

//struct DropdownView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//        DropdownView()
//        }
//        .environment(\.colorScheme, .light)
//
//        NavigationView{
//        DropdownView()
//        }
//        .environment(\.colorScheme, .dark)
//    }
//}
