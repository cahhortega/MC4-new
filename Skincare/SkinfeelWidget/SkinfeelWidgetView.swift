//
//  SkinfeelWidgetView.swift
//  Skincare
//
//  Created by Marcus Vinicius Silva de Sousa on 16/12/21.
//

import SwiftUI
import WidgetKit
import UIKit

var defaults = UserDefaults.standard
public var Products = defaults.stringArray(forKey: "myKey")
var myProducts = [Products]

struct SkinfeelWidgetView: View {
    
    
    
    var productsInShelf: [Products]
    var body: some View{
        
        ShelfList()
        
    }
    
}
struct ShelfList: View {
    
    var body: some View {
        ZStack{
            Color("WidgetBackground").ignoresSafeArea()
            
            
            HStack{
                Text("Minha estante")
                    .font(.system(size: 24, weight: .light, design: .serif))
                
                Text("Qualquer coisa")
                
                
            }
        }
    }
}



struct SkinfeelWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SkinfeelWidgetView()
        }
    }
}
