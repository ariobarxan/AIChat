//
//  ProfileView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettings: Bool = false
    @State private var showCreateAvatarView: Bool = false
    @State private var currentUser: UserModel? = .mock
    @State private var myAvatars: [AvatarModel] = []
    @State private var isLoading: Bool = true

    var body: some View {
        NavigationStack {
            List {
                myInfoSection
                myAvatarsSection
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingButton
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingView()
        }
        .fullScreenCover(isPresented: $showCreateAvatarView) {
            Text("Create Avatar!")
        }
        .task {
            await loadData()
        }
    }

    private func loadData() async {
        try? await Task.sleep(for: .seconds(5))
        isLoading = false
        myAvatars = AvatarModel.mocks
    }

    private var myInfoSection: some View {
        var profileImage: some View {
            ZStack {
                Circle()
                    .fill(currentUser?.profileColorCalculated ?? .accent)
            }
            .frame(width: 100, height: 100)
            .frame(maxWidth: .infinity)
            .removeListRowFormatting()
        }

        return Section { profileImage }
    }

    private var myAvatarsSection: some View {

        var emptyAvatars: some View {
            Group {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Click + to create an avatar")
                }
            }
        }

        var avatars: some View {
            ForEach(myAvatars, id: \.self) { avatar in
                CustomListCell(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: nil
                )
                .anyButton(.highlight, action: {

                })
                .removeListRowFormatting()
            }
            .onDelete { indexSet in
                onDeleteAvatar(indexSet: indexSet)
            }
        }

        func header() -> some View {
            HStack(spacing: 0) {
                Text("My avatars")

                Spacer()

                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundStyle(.accent)
                    .anyButton {
                        onNewAvatarButtonPressed()
                    }
            }
        }

        return Section {
            if myAvatars.isEmpty {
                emptyAvatars
                .padding(50)
                .frame(maxWidth: .infinity)
                .font(.body)
                .foregroundStyle(.secondary)
                .removeListRowFormatting()
            } else {
                avatars
            }
        } header: {header()}

    }

    private var settingButton: some View {
        Image(systemName: "gear")
            .font(.headline)
            .foregroundStyle(.accent)
            .anyButton {
                onSettingButtonPressed()
            }
    }

    private func onSettingButtonPressed() {
        showSettings = true
    }

    private func onNewAvatarButtonPressed() {
        showCreateAvatarView = true
    }

    private func onDeleteAvatar(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        myAvatars.remove(at: index)
    }
}

#Preview {
    ProfileView()
        .environment(AppState())
}
