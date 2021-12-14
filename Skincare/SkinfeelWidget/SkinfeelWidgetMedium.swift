//
//  SkinfeelWidgetMedium.swift
//  SkinfeelWidgetExtension
//
//  Created by Marcus Vinicius Silva de Sousa on 14/12/21.
//

import SwiftUI
import WidgetKit
import UIKit

struct SkinfeelWidgetMedium: View {
  var body: some View {
    HStack{
        Text("Minha rotina diurna").font(.system(size: 17, weight: .light, design: .serif))
      Spacer()
      HStack{
          Circle()
              .fill(Color.init(UIColor(named: "progressCircleButton")!))
              .frame(width: 35, height: 100, alignment: .center)
          Circle()
              .fill(Color.init(UIColor(named: "progressCircleButton")!))
              .frame(width: 35, height: 100, alignment: .center)
          Circle()
              .fill(Color.init(UIColor(named: "progressCircleButton")!))
              .frame(width: 35, height: 100, alignment: .center)
      }
    } .padding()
      .cornerRadius(10)
      .background(Color.gray)
  }
  
}

struct SkinfeelWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        SkinfeelWidgetMedium()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
