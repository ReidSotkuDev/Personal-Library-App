//
//  ContentView.swift
//  project2
//
//  Created by PMStudent on 9/1/21.
//

import SwiftUI

struct ContentView: View {

@State var library = Library()
    @ObservedObject var book: Book
    @Binding var image: UIImage?

    var body: some View {
        NavigationView{
        
            List(Library().sortedBooks) { Book in
            bookRow(book: book,
                    image: $library.uiImages[book])
        }
        .navigationBarTitle("My Library")
            
        }
        
        
    }
}


struct bookRow: View {
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    var body: some View {
        NavigationLink(
            destination: DetailView(book: book, image: $image)
        ) {
            HStack() {
            Book.Image(
                uiImage: image,
                title: Book().title, size: 80,
                
                cornerRadius: 18)
          
                TitleAndAuthorStack(book: book,
                                titleFont: .title2,
                                authorFont: .title3
                                
                                )
            
                .lineLimit(1)
                if !book.microReview.isEmpty{
                Spacer()
                
                Text(book.microReview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)}
                Spacer()
                
                BookmarkButton(book: self.book)
                    .buttonStyle(BorderlessButtonStyle())
                
        }
            .padding(.vertical, 8)
        }
            
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewedInAllColorSchemes
    }
}






