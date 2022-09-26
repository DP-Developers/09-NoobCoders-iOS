//
//  JobsCellView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 26/09/22.
//


import SwiftUI

struct JobsCellView: View {
    
    let job: JobsDataModel
    
    var body: some View {
        ZStack {
            Color.theme.secondaryBackground.ignoresSafeArea()
            
            HStack {
                VStack(alignment: .leading, spacing: 10.0) {
                    jobSection
                    applyNowButton
                }
                Spacer()
            }
            .padding(.vertical)
            .padding(.horizontal)
        }
    }
}

struct JobsCellView_Previews: PreviewProvider {
    static var previews: some View {
        JobsCellView(job: dev.job)
            .previewLayout(.sizeThatFits)
    }
}

extension JobsCellView {
    private var jobSection: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(job.jobtitle)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            Text(job.companyname)
                .font(.subheadline)
                .foregroundColor(Color.theme.darkOrangeColor)
            
            Text(job.companylocation)
                .font(.callout)
                .foregroundColor(Color.theme.secondaryText)
        }
    }
    
    private var applyNowButton: some View {
        Button {
            UIApplication.shared.open(URL(string: job.urllink) ?? URL(string: "https://www.google.com")!)
        } label: {
            Text("Apply Now")
                .foregroundColor(Color.theme.accent)
                .font(.headline)
                .frame(width: 100, height: 40)
                .background(Color.theme.darkOrangeColor)
                .cornerRadius(10)
                .padding(.vertical)
        }
        .buttonStyle(.plain)
    }
}
