//
//  SkinfeelWidget.swift
//  SkinfeelWidget
//
//  Created by Marcus Vinicius Silva de Sousa on 15/12/21.
//

import WidgetKit
import SwiftUI

//struct SkinfeelWidgetView: View {
//    var body: some View {
//        ZStack{
//            Color("WidgetBackground").ignoresSafeArea()
//            VStack(alignment: .leading){
//                Text("Minha rotina diária")
//                    .font(.system(size: 14, weight: .light, design: .serif))
//                HStack{
//                    VStack {
//                        Circle().frame(width: 60, height: 60).foregroundColor(.red)
//                        Text("Manhã")
//                    }
//                    VStack {
//                        Circle().frame(width: 60, height: 60).foregroundColor(.red)
//                        Text("Tarde")
//                    }
//                    VStack {
//                        Circle().frame(width: 60, height: 60).foregroundColor(.red)
//                        Text("Noite")
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//struct Provider: TimelineProvider {
//    
//    typealias Entry = MeuModelo
//    
//
//    func getSnapshot(in context: Context, completion: @escaping (Meu Modelo) -> Void) {
//        let loadingData = Meu Modelo
//                completion(loadingData)
//    }
//
//    func getTimeline(in context: Context, completion: @escaping (Timeline<Meu Modelo>) -> Void) {
//        print("")
//    }
//
//    func placeholder(in context: Context) -> MeuModelo {
//        return (Retornar o Meu Modelo)
//    }
//
//    @main
//    struct SkinfeelWidget: Widget {
//        let kind: String = "SkinfeelWidget"
//
//        var body: some WidgetConfiguration {
//            StaticConfiguration(kind: kind, provider: Provider()) { entry in
//                SkinfeelWidgetView()
//            }
//            .configurationDisplayName("My Widget")
//            .description("This is an example widget.")
//        }
//    }
    












//    struct SkinfeelWidget_Previews: PreviewProvider {
//        static var previews: some View {
//            SkinfeelWidgetEntryView(entry: SimpleEntry(date: Date()))
//                .previewContext(WidgetPreviewContext(family: .systemSmall))
//        }
//    }
    
//    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date())
//        completion(entry)
//    }
//
//    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//}
//
//struct SkinfeelWidgetEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        Text(entry.date, style: .time)
//    }
//}
//


//struct Model: TimelineEntry{
//    var date: Date
//    var widgetData: [JSONModel]
//}
//
//struct JSONModel: Decodable {
//
//    var id: Double
//    var nome: String
//}
//
//struct Provider: TimelineProvider {
//
//    func snapshot (with context: Context, completion: @escaping (Model) -> ()) {
//
//        let loadingData = Model(date: Date(), widgetData: Array(repeating: JSONModel(id: 0, nome: "", count: 22))
//        completion(loadingData)
//
//    }
//
//        func timeline(with context: Context, completion: @escaping (Timeline<Model>) ->()){
//
//            getData{ (modelData) in
//
//                let date = Date()
//
//                let data = Model(date: date , widgetData: modelData)
//
//                let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
//
//                completion(timeline)
//
//            }
//    }
//}
//
//struct WidgetView: View {
//
//            var data: Model
//
//        var body: some View{
//
//            VStack(alignment: .leading, spacing: 5){
//                Text("Produtos para a sua rotina diária")
//                    .font(.title)
//                    .fontWeight(.light)
//
//                HStack(spacing: 15){
//
//                    ForEach(data.widgetData, id: \.self){
//                        if value.nome == value.id == 0{
//
//                        }
//                    }
//                }
//            }
//
//            }
//        }
//
//                                func getData(completion: @escaping ([JSONModel] -> ())){
//
//            let url = "https://restapi-skinfeel.herokuapp.com/produtos"
//
//            let session = URLSession(configuration: .default)
//
//            session.dataTask(with: URL(string: url)! { (data, _ err) in
//
//                if err != nil{
//                    print(err!.localizedDescription)
//
//                    return
//
//                }
//
//                do{
//                    let jsonData = try JSONDecoder().decode([JSONModel], from: data!)
//
//                    completion(jsonData)
//
//                }
//                catch{
//
//                    print(error.localizedDescription)
//                }
//            })
//
//        }
