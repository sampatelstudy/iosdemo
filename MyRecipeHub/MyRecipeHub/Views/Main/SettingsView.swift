//
//  SettingsView.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 13/02/23.
//

import SwiftUI

struct SettingsView: View {
    @State var statusbool : Bool = false
    @State private var  darkmode : Bool = false
    @EnvironmentObject var recipeVM : RecipeViewModel
    @State var version: String = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")
    @State private var showAboutUsAlert = false
    var body: some View {
        NavigationView{
            List(content: {
                HStack {
                    Text("App version")
                        .font(.headline)
                    Spacer()
                    Text(version)
                        .font(.headline)
                }
                HStack {
                    Text("Dark Mode")
                        .font(.headline)
                    Spacer()
                    Toggle(isOn: $darkmode) {
                        Text("\(setdarkmodeuserdefault(value: darkmode))")
                    }.tint(.gray)
                }
                Button {
                    shareApp()
                } label: {
                    Text("Share App")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                }
                Button {
                    self.showAboutUsAlert = true
                } label: {
                    Text("About Us")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                }
                
            })
            .navigationTitle("Settings")
            .alert(isPresented: $showAboutUsAlert) {
                Alert(title: Text("About US"), message: Text(Constants.aboutusText.rawValue), dismissButton: .default(Text("OK")))
            }
        }.navigationViewStyle(.stack)
    }
    
    func setdarkmodeuserdefault(value:Bool) -> String{
        let userInfo: [AnyHashable: Any] = ["isOn": value]
        NotificationCenter.default.post(name: Notification.Name("DARKMODE"), object: nil, userInfo: userInfo)
        return ""
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(RecipeViewModel())
    }
}

extension SettingsView {
    func shareApp(){
        let url = URL(string: Constants.appshareurl.rawValue)
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let windows = windowScene.windows
            windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
        }
    }
    
    
}
