import oscP5.*; // oscP5 Library importieren
import netP5.*; // netP5 Library importieren
 
OscP5 oscP5; // Kontrollobjekt anlegen
NetAddress remoteLocation; // Zieladresse anlegen

void setup() {
	oscP5 = new OscP5(this, 12000); // Library starten und auf Port 12000 auf eingehende Nachrichten warten
	remoteLocation = new NetAddress("127.0.0.1", 12000); // Die IP Adresse sowie der Port des Empfänger
}

void mousePressed() {
	OscMessage msg = new OscMessage("/test"); // Neue Nachricht mit "/test" als Adress-Muster
	msg.add(123); // Einfache Zahl anhängen
	oscP5.send(msg, remoteLocation);  // Senden der Nachricht
}

void oscEvent(OscMessage msg) {
	println("### Neue Nachricht");
	println("AddrPattern: " + msg.addrPattern()); // Ausgeben des Adress-Muster
	println("TypeTag: " + msg.typetag()); // Ausgeben des Type-Tag

	// Adress-Muster überprüfen
	if(msg.addrPattern().equals("/test")) {
		// Mitgesendete Zahl ausgeben
		println(msg.get(0).intValue());
	}
}