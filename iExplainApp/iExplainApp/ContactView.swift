import SwiftUI

struct ContactView: View {
    var brandBlue: Color

    var body: some View {
        NavigationStack {
            List {
                Section(header: SectionHeader(title: "Zarząd", color: brandBlue)) {
                    ContactRow(
                        name: "Tomasz Wyroślak",
                        role: "Prezes Zarządu – Project Manager",
                        email: "tomasz.wyroslak@iexplain.pl",
                        phone: "+48882139029",
                        brandBlue: brandBlue
                    )

                    ContactRow(
                        name: "Michał Gonciarz",
                        role: "Wiceprezes Zarządu",
                        email: "michal.gonciarz@iexplain.pl",
                        phone: "+48600393270",
                        brandBlue: brandBlue
                    )
                }

                Section(header: SectionHeader(title: "Siedziba", color: brandBlue)) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("iExplain Sp. z o.o.")
                            .font(.headline)

                        Text("ul. Osiedle Zalesie 69")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("73-108 Kobylanka")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("KRS: 0000609444")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }

                Section(header: SectionHeader(title: "WWW", color: brandBlue)) {
                    Button(action: {
                        if let url = URL(string: "https://www.iexplain.pl") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Image(systemName: "globe")
                            Text("www.iexplain.pl")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .foregroundColor(brandBlue)
                    }
                }

                Section(header: SectionHeader(title: "Godziny pracy", color: brandBlue)) {
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(brandBlue)
                        VStack(alignment: .leading) {
                            Text("Poniedziałek – Piątek")
                                .font(.subheadline)
                            Text("9:00 – 17:00")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Skontaktuj się z nami")
        }
    }
}

struct ContactRow: View {
    var name: String
    var role: String
    var email: String
    var phone: String
    var brandBlue: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.title)
                    .foregroundColor(brandBlue)

                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.headline)
                    Text(role)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            HStack(spacing: 12) {
                Button(action: {
                    if let url = URL(string: "tel://\(phone)") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Image(systemName: "phone.circle.fill")
                            .font(.title3)
                        Text("Zadzwoń")
                            .font(.subheadline)
                    }
                    .foregroundColor(.green)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
                }

                Button(action: {
                    if let url = URL(string: "mailto:\(email)") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Image(systemName: "envelope.circle.fill")
                            .font(.title3)
                        Text("Napisz")
                            .font(.subheadline)
                    }
                    .foregroundColor(brandBlue)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(brandBlue.opacity(0.1))
                    .cornerRadius(8)
                }
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    ContactView(brandBlue: Color(red: 0.2, green: 0.6, blue: 0.9))
}
