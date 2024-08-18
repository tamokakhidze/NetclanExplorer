//
//  UserCard.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 17.08.24.
//

import SwiftUI

// MARK: - UserCard

struct UserCard: View {
    
    // MARK: - Properties

    var user: User
    var usertype: Segment
    
    // MARK: - Body

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 250)
                .foregroundStyle(Color.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.1), radius: 10)
           
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Text("+ INVITE")
                            .font(.system(size: 22))
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
                
                HStack(spacing:-20) {
                    AsyncImage(url: URL(string: "https://media.licdn.com/dms/image/v2/C4D03AQEeEyYzNtDq7g/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1524234561685?e=2147483647&v=beta&t=uHzeaBv3V2z6Tp6wvhzGABlTs9HR-SP-tEX1UbYNn4Q")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .cornerRadius(20)
                            .offset(x: -30)
                            
                    } placeholder: {
                        ProgressView()
                    }

                    VStack {
                        HStack {
                            Text(user.name)
                                .font(.system(size: 20))
                                .bold()
                                .foregroundStyle(.primaryBlue)
                            Spacer()
                        }
                        
                        HStack() {
                            Text("\(user.location),")
                                .font(.system(size: 14))
                            Text("within \(user.distance, specifier: "%.0f") Km")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        
                        if usertype == .merchant {
                            HStack {
                                Image(.contactEmailIcon)
                                Image(.contactMobileIcon)
                                Spacer()
                            }
                        } else {
                            HStack {
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .frame(width: 200, height: 15)
                                        .foregroundStyle(.gray.opacity(0.2))
                                        .cornerRadius(50)
                                    
                                    Rectangle()
                                        .frame(width: user.distance * 2, height: 15)
                                        .foregroundStyle(.primaryBlue.opacity(0.8))
                                        .cornerRadius(50)
                                        .padding(.leading, 0)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                }
                
                if usertype == .merchant {
                    Text(user.service)
                        .bold()
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                } else if usertype == .professional {
                    HStack {
                        Text("\(user.profession) | \(user.experience) years of experience")
                            .bold()
                            .font(.system(size: 17))
                            .padding(.leading)
                            .foregroundStyle(.primaryBlue)
                        Spacer()
                    }
                } else {
                    HStack {
                        ForEach(0..<min(user.purposes.count, 3), id: \.self) { index in
                            Text(user.purposes[index].text)
                                .bold()
                                .font(.system(size: 15))
                                .foregroundStyle(.primaryBlue)
                            
                            if index < min(user.purposes.count, 3) - 1 {
                                Text("|")
                                    .bold()
                                    .font(.system(size: 16))
                                    .foregroundStyle(.primaryBlue)
                            }
                        }
                        Spacer()
                    }
                    .padding(.leading)

                }
                
                Text(user.status)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom)
                    
            }.padding()
        }
    }
}

#Preview {
   ExploreView()
}
