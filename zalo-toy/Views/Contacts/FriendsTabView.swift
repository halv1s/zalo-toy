import SwiftUI

struct FriendsTabView: View {
    @State private var selectedFilter = 0 // 0: All, 1: Recently online
    @ObservedObject var viewModel: ContactsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                VStack(spacing: 0) {
                    FriendRequestSection(count: viewModel.friendRequestsCount)
                    PhonebookSection()
                    BirthdaySection()
                }
                .background(Color(.systemBackground))
                
                VStack(spacing: 0) {
                    FilterSection(
                        selectedFilter: $selectedFilter,
                        allCount: viewModel.allContactsCount,
                        onlineCount: viewModel.onlineContactsCount
                    )
                    
                    Divider()
                    
                    CloseFriendsSection(closeFriends: viewModel.closeFriends)
                    
                    ContactsList(
                        selectedFilter: selectedFilter,
                        groupedContacts: viewModel.getGroupedContacts(filter: selectedFilter)
                    )
                }
                .background(Color(.systemBackground))
            }
        }
    }
}

struct FriendRequestSection: View {
    let count: Int
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: "person.2.circle.fill")
                    .font(.title2)
                    .foregroundColor(Color("ZaloB60Color"))
                
                HStack(spacing: 4) {
                    Text("Friend request")
                        .font(.system(size: 16, weight: .medium))
                    Text("(\(count))")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            .padding(.vertical, 16)
        }
    }
}

struct PhonebookSection: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: "book.circle.fill")
                    .font(.title2)
                    .foregroundColor(Color("ZaloB60Color"))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Phonebook")
                        .font(.system(size: 16, weight: .medium))
                    Text("Contacts who use Zalo")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            .padding(.vertical, 16)
        }
    }
}

struct BirthdaySection: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: "gift.circle.fill")
                    .font(.title2)
                    .foregroundColor(Color("ZaloB60Color"))
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text("Birthdays")
                            .font(.system(size: 16, weight: .medium))
                        Circle()
                            .fill(.red)
                            .frame(width: 8, height: 8)
                    }
                    Text("Today is John Smith's birthday")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            .padding(.vertical, 16)
        }
    }
}

struct FilterSection: View {
    @Binding var selectedFilter: Int
    let allCount: Int
    let onlineCount: Int
    
    var body: some View {
        HStack(spacing: 12) {
            FilterButton(
                title: "All \(allCount)",
                isSelected: selectedFilter == 0
            ) {
                selectedFilter = 0
            }
            
            FilterButton(
                title: "Recently online \(onlineCount)",
                isSelected: selectedFilter == 1
            ) {
                selectedFilter = 1
            }
            
            Spacer()
        }
        .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
        .padding(.vertical, 16)
    }
}

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(isSelected ? .black : .gray)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(isSelected ? Color(.systemGray5) : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(.systemGray4), lineWidth: isSelected ? 0 : 1)
                        )
                )
        }
    }
}

struct CloseFriendsSection: View {
    let closeFriends: [Contact]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 14))
                    .frame(width: 14, height: 14)
                
                Text("Close friends")
                    .font(.system(size: 14, weight: .medium))
                
                Spacer()
                
                Button("+ Add") {
                    print("Add close friend tapped")
                }
                .font(.system(size: 14))
                .foregroundColor(Color("ZaloB60Color"))
            }
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            
            if !closeFriends.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 24) {
                        ForEach(closeFriends) { contact in
                            CloseFriendItem(contact: contact)
                        }
                    }
                    .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                }
            }
        }
        .padding(.vertical, 16)
    }
}

struct CloseFriendItem: View {
    let contact: Contact
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: contact.profileImage)
                    .font(.system(size: 50))
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("ZaloB60Color"))
                    .clipShape(Circle())
                
                if contact.isOnline {
                    Circle()
                        .fill(.green)
                        .frame(width: 12, height: 12)
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth: 2)
                        )
                }
            }
            
            Text(contact.name.components(separatedBy: " ").first ?? "")
                .font(.system(size: 12))
                .lineLimit(1)
        }
    }
}

struct ContactsList: View {
    let selectedFilter: Int
    let groupedContacts: [String: [Contact]]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(groupedContacts.keys.sorted(), id: \.self) { letter in
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(letter)
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                    }
                    .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                    .padding(.vertical, 8)
                    
                    ForEach(groupedContacts[letter] ?? []) { contact in
                        ContactRow(contact: contact)
                    }
                }
            }
        }
        .background(Color(.systemBackground))
    }
}

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: contact.profileImage)
                    .font(.system(size: 40))
                    .foregroundColor(Color("ZaloB60Color"))
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                if contact.isOnline {
                    Circle()
                        .fill(.green)
                        .frame(width: 12, height: 12)
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth: 2)
                        )
                }
            }
            
            HStack(spacing: 8) {
                Text(contact.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                
                if contact.isFavorite {
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .frame(width: 12, height: 12)
                        .foregroundColor(.yellow)
                }
            }
            
            Spacer()
            
            HStack(spacing: 16) {
                Button(action: {
                    print("Call \(contact.name)")
                }) {
                    Image(systemName: "phone")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                
                Button(action: {
                    print("Video call \(contact.name)")
                }) {
                    Image(systemName: "video")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
        .padding(.vertical, 12)
        .background(Color(.systemBackground))
    }
}

#Preview {
    FriendsTabView(viewModel: ContactsViewModel())
}
