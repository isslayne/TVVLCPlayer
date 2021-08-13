//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Layne on 2021/8/13.
//  Copyright © 2021 Jérémy Marchand. All rights reserved.
//

import SwiftUI
import TVVLCPlayer
import TVVLCKit

struct TestTVVLCPlayerController: UIViewControllerRepresentable {
    typealias UIViewControllerType = VLCPlayerViewController
    
    func makeUIViewController(context: Context) -> VLCPlayerViewController {
        let player = VLCMediaPlayer()
        let media: VLCMedia = VLCMedia(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/88/Big_Buck_Bunny_alt.webm")!)
        media.addOption(":http-user-agent=AppleCoreMedia/1.0.0.18L191 (Apple TV; U; CPU OS 14_5 like Mac OS X; zh_cn)")
//        player.addPlaybackSlave(URL(string: "http://raw.githubusercontent.com/chinanf-boy/translate-srt/master/test.zh.srt")!, type: .subtitle, enforce: true)
        player.addPlaybackSlave(URL(string: "http://raw.githubusercontent.com/chinanf-boy/translate-srt/master/test.zh.srt"), type: .subtitle, enforce: true)
        player.media = media
        let playerViewController = VLCPlayerViewController.instantiate(player: player)
        return playerViewController
    }
    func updateUIViewController(_ uiViewController: VLCPlayerViewController, context: Context) {
    }
}

struct TestPlayerView: View {
    var body: some View {
        TestTVVLCPlayerController()
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct SearchView: View {
    var body: some View {
        VStack {
            NavigationLink(
            destination: TestPlayerView()
            ) {
                Image(systemName: "folder.fill")
                    .font(.system(size: 120))
                    .foregroundColor(.yellow)
                    .frame(width: 240, height: 360)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(12)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                SearchView()
                    .tabItem {
                        HStack {
                            Text("搜索")
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 60))
                        }
                    }
            }
            .padding(.top, -60)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
