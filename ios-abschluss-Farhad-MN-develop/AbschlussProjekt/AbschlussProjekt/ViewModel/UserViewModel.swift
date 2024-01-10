//
//  UserViewModel.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.
//



import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserViewModel: ObservableObject {
    
    // MARK: Überprüft die Authentifizierung beim Initialisieren des View-Modells
    init() {
        
        checkAuth()
    }
    
    // MARK: Firebase Authentifizierungsobjekt
    private var auth = Auth.auth()
    
    // MARK: Veröffentlichtes Property, um Änderungen im User-Status zu überwachen
    @Published var user: FireUser?
    
    // MARK: Gibt an, ob ein Benutzer angemeldet ist oder nicht
    var isUserLoggedIn: Bool {
        user != nil
    }
   
    // MARK: Gibt den Nachnamen des Benutzers zurück oder einen leeren String, wenn der Benutzer nicht vorhanden ist
    var name: String {
        user?.name ?? ""
    }
    
    // MARK: Gibt die E-Mail des Benutzers zurück oder einen leeren String, wenn der Benutzer nicht vorhanden ist
    var email: String {
        user?.email ?? ""
    }
    var image: String {
        user?.image ?? ""
    }
    
    
    // MARK: Überprüft, ob ein Benutzer bereits angemeldet ist
    private func checkAuth() {
        guard let currentUser = auth.currentUser else {
            print("Not logged in")
            return
        }
        self.fetchUser(id: currentUser.uid)
    }
    
    // MARK: Funktion zum Anmelden eines Benutzers mit E-Mail und Passwort
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Login failed", error.localizedDescription)
                return
            }
// MARK: Bei erfolgreicher Anmeldung wird der Benutzer abgerufen
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is logged in with id '\(authResult.user.uid)'")
            self.fetchUser(id: authResult.user.uid)
        }
        
    }
    
    // MARK: Funktion zur Registrierung eines neuen Benutzers mit E-Mail, Passwort und Nachnamen
    func register(email: String, password: String, name: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Registration failde:", error.localizedDescription)
                return
            }
            // MARK: Bei erfolgreicher Registrierung wird der Benutzer erstellt und angemeldet
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            self.createUser(id: authResult.user.uid, email: email, name: name)
            
            self.login(email: email, password: password)
            
        }
    }
    
    // MARK: Funktion zum Abmelden eines Benutzers
    func logout() {
        do {
            // MARK: Setzt den aktuellen Benutzer auf nil
            try auth.signOut()
            self.user = nil
            
            print("User was logged out!")
            
        } catch {
            print("Logout failed: \(error.localizedDescription)")
        }
    }
    
}

// MARK: Diese Erweiterung ("extension") wird für die Klasse `UserViewModel` definiert und enthält eine Methode zur Erstellung eines Benutzers in Firebase.
extension UserViewModel {
    
// Die Methode `createUser` erstellt einen neuen Benutzer in der Firebase-Datenbank mit den bereitgestellten Informationen.
    func createUser(id: String, email: String, name: String) {
        
// Erstellt ein FireUser-Objekt mit den übergebenen Informationen sowie einer generierten UUID und dem aktuellen Datum.
     let user = FireUser(id: UUID(), image: image, email: email, name: name, registeredAt: Date())
        
        do {
// Versucht, die Benutzerdaten in der Firebase-Datenbank unter der angegebenen ID zu speichern.
            try FirebaseManager.shared.database.collection("users").document(id).setData(from: user)
        } catch let error {
            
// Zeigt einen Fehler an, falls das Speichern der Benutzerdaten fehlschlägt.
            print("Error saving user: \(error)")
        }
    }
    
    // MARK: Funktion zum Abrufen eines Benutzers aus der Firestore-Datenbank
    func fetchUser(id: String) {
        
        // FirebaseManager: Eine Instanz des FirebaseManager wird verwendet, um auf die Firebase-Datenbank zuzugreifen.
        FirebaseManager.shared.database.collection("users").document(id)
            .getDocument { document, error in
                
                // Überprüfen, ob beim Abrufen des Dokuments ein Fehler aufgetreten ist.
                if let error {
                    // Fehler beim Abrufen des Benutzers wird ausgegeben.
                    print("Fetching user failed:", error.localizedDescription)
                    return
                }
                // Überprüfen, ob das Dokument vorhanden ist.
                guard let document else {
                    // Wenn das Dokument nicht existiert, wird eine Meldung ausgegeben.
                    print("Document does not exist!")
                    return
                }
                do {
                    // Konvertiert das Dokument in ein FireUser-Objekt, falls möglich.
                    let user = try document.data(as: FireUser.self)
                    
                    // Setzt den aktuellen Benutzer im ViewModel mit den erhaltenen Daten.
                    self.user = user
                } catch {
                    // Wenn das Dokument nicht in ein FireUser-Objekt konvertiert werden kann, wird ein Fehler ausgegeben.
                    print("Document is not a user", error.localizedDescription)
                }
            }
    }
}
