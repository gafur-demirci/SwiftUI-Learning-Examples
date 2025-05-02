//
//  DevoteWidget.swift
//  DevoteWidget
//
//  Created by Abdulgafur Demirci on 2.05.2025.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct DevoteWidgetEntryView : View {
    var entry: Provider.Entry
    
    // MARK: - PROPERTIES
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var fontStyle: Font {
      if widgetFamily == .systemSmall {
        return .system(.footnote, design: .rounded)
      } else {
        return .system(.headline, design: .rounded)
      }
    }

    var body: some View {
//        VStack {
//            Text("Time:")
//            Text(entry.date, style: .time)
//
//            Text("Favorite Emojies:")
//            Text(entry.configuration.favoriteEmoji)
//        }
        GeometryReader { geometry in
          ZStack {
            backgroundGradient
            
            Image("rocket-small")
              .resizable()
              .scaledToFit()
            
            Image("logo")
              .resizable()
              .frame(
                width: widgetFamily != .systemSmall ? 56 : 36,
                height: widgetFamily != .systemSmall ? 56 : 36
              )
              .offset(
                x: (geometry.size.width / 2) - 20,
                y: (geometry.size.height / -2) + 20
              )
              .padding(.top, widgetFamily != .systemSmall ? 32 : 12)
              .padding(.trailing, widgetFamily != .systemSmall ? 32 : 12)
            
            HStack {
              Text("Just Do It")
                .foregroundColor(.white)
                .font(fontStyle)
                .fontWeight(.bold)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(
                  Color(red: 0, green: 0, blue: 0, opacity: 0.5)
                    .blendMode(.overlay)
                )
                .clipShape(Capsule())
              
              if widgetFamily != .systemSmall {
                Spacer()
              }
            } //: HSTACK
            .padding()
            .offset(y: (geometry.size.height / 2) - 24)
          } //: ZSTACK
        } //: GEOMETRY
    }
}

struct DevoteWidget: Widget {
    let kind: String = "DevoteWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            DevoteWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    DevoteWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
