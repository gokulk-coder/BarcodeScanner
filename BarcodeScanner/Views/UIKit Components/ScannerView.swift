//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Gokul Kattamanchi on 9/21/21.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
  
  @Binding var scannedCode: String
  @Binding var alertItem: AlertItem?
  
  func makeUIViewController(context: Context) -> ScannerVC {
    ScannerVC(scannerDelegate: context.coordinator)
  }
  
  func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
  
  func makeCoordinator() -> Coordinator {
    Coordinator(scannerView: self)
  }
}

extension ScannerView {
  final class Coordinator: NSObject, ScannerVCDelegate {
    
    private let scannerView: ScannerView
    
    init(scannerView: ScannerView) {
      self.scannerView = scannerView
    }
    
    func didFind(barcode: String) {
      scannerView.scannedCode = barcode
      print(barcode)
    }
    
    func didSurface(error: CameraError) {
      switch error {
      case .invalidDeviceInput:
        scannerView.alertItem = AlertContext.invalidDeviceInput
      case .invalidScannedValue:
        scannerView.alertItem = AlertContext.invalidScannedInput
      }
    }
  }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
      ScannerView(scannedCode: .constant("123456"), alertItem: .constant(AlertContext.invalidScannedInput))
    }
}
