//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Gokul Kattamanchi on 9/22/21.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
  @Published var scannedCode = ""
  @Published var alertItem: AlertItem?
  
  var statusText: String {
    scannedCode.isEmpty ? "Not yet Scanned" : scannedCode
  }
  
  var statusTextColor: Color {
    scannedCode.isEmpty ? .red : .green
  }
}
