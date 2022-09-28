//
//  ResourceSheetView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 27/09/22.
//

import SwiftUI
struct ResourceSheetView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var addResource: Bool = true
    @StateObject private var contributeResourceVm: ContributeResourceViewModel = ContributeResourceViewModel()
    @StateObject private var resourceVm: ResourceViewModel = ResourceViewModel()
    private let resourceDataService = ResourceDataService()
    @State var creatorName: String = ""
    @State var description: String = ""
    @State var tags: String = ""
    @State var title: String = ""
    @State var type: String = ""
    @State var url: String = ""
    @State var upvotes: Int = 0
    @State var downvotes: Int = 0
    
    enum ResourceType: String, CaseIterable, Identifiable {
        case PDF, Course, Link, Article
        var id: Self { self }
    }
    
    @State var selectedResourceType: ResourceType = .Course
    
    var body: some View {
        if addResource {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20.0) {
                    creatorNameTextField
                    tagsTextField
                    titleTextField
                    descriptionTextField
                    resourceType
                    urlTextField
                    submitButton
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Contribute Resource")
        }
//        NavigationView {
//            ZStack {
//                Color.theme.background.ignoresSafeArea()
//
//                VStack(alignment: .leading, spacing: 20.0) {
//                    creatorNameTextField
//                    tagsTextField
//                    titleTextField
//                    descriptionTextField
//                    resourceType
//                    urlTextField
//                    submitButton
//                    Spacer()
//                }
//                .padding()
//            }
//            .navigationTitle("Contribute Resource")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "xmark")
//                            .font(.headline)
//                    }
//                }
            }
        }
//    }
//}

struct ResourceSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceSheetView()
    }
}

extension ResourceSheetView {
    private var creatorNameTextField: some View {
        TextField("", text: $creatorName)
            .placeholder(when: creatorName.isEmpty, placeholder: {
                Text("Enter your name")
                    .foregroundColor(.gray)
            })
            .disableAutocorrection(true)
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .padding(.horizontal)
            .background(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
            .cornerRadius(10)
    }
    
    private var tagsTextField: some View {
        TextField("", text: $tags)
            .placeholder(when: tags.isEmpty, placeholder: {
                Text("Tags...")
                    .foregroundColor(.gray)
            })
            .disableAutocorrection(true)
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .padding(.horizontal)
            .background(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
            .cornerRadius(10)
    }
    
    private var titleTextField: some View {
        TextField("", text: $title)
            .placeholder(when: title.isEmpty, placeholder: {
                Text("Resource title")
                    .foregroundColor(.gray)
            })
            .disableAutocorrection(true)
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .padding(.horizontal)
            .background(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
            .cornerRadius(10)
    }
    
    private var descriptionTextField: some View {
        TextField("", text: $description)
            .placeholder(when: description.isEmpty, placeholder: {
                Text("Summary about resource")
                    .foregroundColor(.gray)
            })
            .disableAutocorrection(true)
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .padding(.horizontal)
            .background(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
            .cornerRadius(10)
    }
    
    private var resourceType: some View {
        Picker("Resource Type", selection: $selectedResourceType) {
            Text("PDF").tag(ResourceType.PDF)
            Text("Course").tag(ResourceType.Course)
            Text("Link").tag(ResourceType.Link)
            Text("Article").tag(ResourceType.Article)
        }
        .padding(.horizontal)
        .padding(.vertical)
        .pickerStyle(.segmented)
    }
    
    private var urlTextField: some View {
        TextField("", text: $url)
            .placeholder(when: url.isEmpty, placeholder: {
                Text("Link of the resource")
                    .foregroundColor(.gray)
            })
            .disableAutocorrection(true)
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .padding(.horizontal)
            .background(Color(red: 0.16, green: 0.15, blue: 0.31, opacity: 1.00))
            .cornerRadius(10)
            .padding(.bottom, 30)
    }
    
    private var submitButton: some View {
        Button {
//                contributeResourceVm.addDataToFirebase(newResource: ResourceModel(creator: creatorName, desc: description, tags: tags, title: title, type: selectedResourceType.rawValue, url: url, upvotes: 0, downvotes: 0))
            
            contributeResourceVm.addDataToFirebase(newResource: ResourceModel(creator: creatorName, desc: description, tags: tags, title: title, type: selectedResourceType.rawValue, url: url, upvotes: 0, downvotes: 0, upvotedusers: [], downvotedusers: []))
            
            
            dismiss()
        } label: {
            Text("Submit")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(
                    Color.theme.lightOrangeColor
                )
                .cornerRadius(10)
                .padding(.horizontal)
                .shadow(color: Color.theme.lightOrangeColor.opacity(0.2), radius: 10, x: 0, y: 10)
        }
    }
}
