//
//  WebKitView.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 15/03/23.
//

import SwiftUI
import WebKit

struct WebKitView: View {
    var urltoopen : String
    var body: some View {
        WebView(request: URLRequest(url: URL(string: urltoopen)!))
    }
}

struct WebKitView_Previews: PreviewProvider {
    static var previews: some View {
        WebKitView(urltoopen: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {
    let request: URLRequest

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(request)
    }
}


