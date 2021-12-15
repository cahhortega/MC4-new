//
//  SkinfeelWidgetM.swift
//  SkinfeelWidgetExtension
//
//  Created by Carolina Ortega on 14/12/21.
//

import SwiftUI
import WidgetKit
import UIKit

struct SkinfeelWidgetMedium: View {
  var body: some View {
      VStack{
          Text("Minha rotina diurna").font(.system(size: 20)).fontWeight(.medium).multilineTextAlignment(.leading)
              .padding()
//        Spacer()
          HStack(alignment: .center, spacing: 50){
          Circle()
              .fill(Color.init(UIColor(named: "progressCircleButton")!))
              .frame(width: 50, height: 50, alignment: .center)
          Circle()
              .fill(Color.init(UIColor(named: "progressCircleButton")!))
              .frame(width: 50, height: 50, alignment: .center)
          Circle()
              .fill(Color.init(UIColor(named: "progressCircleButton")!))
              .frame(width: 50, height: 50, alignment: .center)
      }
    } .padding()
      .cornerRadius(10)
      
  }
}

struct SkinfeelWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        SkinfeelWidgetMedium()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
