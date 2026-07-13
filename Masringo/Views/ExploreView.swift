import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @EnvironmentObject var languageManager: LanguageManager
    var allItems: [LessonItem] {
        return lessons + audioLessons + exercises
    }

    var filteredLessons: [LessonItem] {
        if searchText.isEmpty {
            return allItems
        } else {
            return allItems.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredLessons, id: \.name) { lesson in
                HStack {
                    Image(systemName: lesson.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    Text(localized(lesson.name, with: languageManager))
                }
                .padding(.vertical, 8)
            }
            .searchable(text: $searchText, prompt: "Search lessons or topics")
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
}

#Preview {
    ExploreView()
        .environmentObject(LanguageManager())
}
