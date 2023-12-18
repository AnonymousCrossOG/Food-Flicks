
import SwiftUI

struct ContentView: View {
    let columnLayout = Array(repeating: GridItem(), count: 3)
    
    @State private var selectedImage: Image? = nil
    
    let imageNames: [String] = ["Food2", "Food3", "Food4"]
    
//    let allImages: [Image] = [
//        Image("michael"),
//        Image("leonard"),
//        Image("donis")
//    ]
    
    var body: some View {
        VStack {
            Text("Food Ideas and notes!")
                .font(.title)
            HStack{
                Button("Notes"){
                    print("Notes")
                }
                .offset(x: -290.0, y: -40.0)
                .font(.title)
                .foregroundColor(.blue)
                Button("Favs"){
                    print("Favs")
                }
                .offset(x: -250.0, y: -40.0)
                .font(.title)
                .foregroundColor(.blue)
            }
            
           
            ScrollView(.horizontal) {
                LazyHStack{
                  
                    ForEach(imageNames, id: \.self) { imageName in 
                        let image = Image(imageName)
                        Button(action: {
                            selectedImage = image
                        }) {
                            RoundedRectangle(cornerRadius: 4.0)
                                .aspectRatio(1.0, contentMode: ContentMode.fit)
                                .foregroundColor(selectedImage == image ? .blue : .blue)
                            // .foregroundColor(.blue)
                                .overlay(
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                )
                        }
                        .buttonStyle(.plain)
                }
                
                }
            }
            

        }
        .padding(10)
    }
}
