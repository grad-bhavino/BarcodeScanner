//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Bhavin  Oza on 2/20/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    
//    @State private var scannedCode = ""
////    @State private var isShowingAlert = false
//    @State private var alertItem: AlertItem?
    
    @StateObject var viewModel = BarcodeScannerViewModel()
     
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode", image: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                
//                Button {
//                    isShowingAlert = true
//                } label: {
//                    Text("Tap Me")
//                }
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alert in //only single alert allowed on a screen
                Alert(title: Text(alert.title),
                      message: Text(alert.message),
                      dismissButton: alert.dismissButton)
            }
//            .alert(isPresented: $isShowingAlert) {
//                Alert(title: Text("Test"), message: Text("This is a test"), dismissButton: .default(Text("Ok")))
//            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
