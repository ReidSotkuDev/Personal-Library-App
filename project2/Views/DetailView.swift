//
//  DetailView.swift
//  project2
//
//  Created by PMStudent on 9/2/21.
//

import SwiftUI
import class PhotosUI.PHPickerViewController
import UIKit
struct DetailView: View {
   @ObservedObject var book: Book
    @Binding var image: UIImage?
    @State var alertVisible = false
    @State var showingImagePicker = false
    
    
    var body: some View {
       
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                BookmarkButton(book: book)
                
                
                TitleAndAuthorStack(book: book,
                                    titleFont: .title,
                                authorFont: .title2)
            }
            VStack {
                Divider()
                    .padding(.vertical)
                TextField(
                    "Review...",
                    text: $book.microReview
                )
                Divider()
                    .padding(.vertical)
                
                Book.Image(
                    
                    uiImage: image,
                    title: book.title,
                    cornerRadius: 16)
                    .scaledToFit()
                HStack{
                Button("Update Image..."){
                    
                    showingImagePicker = true
                    
                }
                    
                    if image != nil{
                        Spacer()
                    Button("Delete Image"){
                        alertVisible = true
                    }
                    
                    
                }
                }
                .padding()

                
            }
                
            Spacer()

        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)

        }
        .alert(isPresented: $alertVisible) {
            .init(title: .init("Delete image for \(book.title)?"), primaryButton: .destructive(.init("Delete")) {
                image = nil
                
            }, secondaryButton: .cancel(){
                alertVisible = false
            })
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil) )
            .previewedInAllColorSchemes
    }
}
