#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClientSecure.h>

const char* ssid = "NITJ-WiFi";  
const char* loginURL = "http://10.10.11.1:8090/httpclient.html";  // Captive Portal
const char* apiURL = "https://nitj-barcode.onrender.com/students/rno";  // API Endpoint

WiFiClient client;
WiFiClientSecure secureClient;

void setup() {
    Serial.begin(115200);
    Serial.println("\nESP8266 Starting...");

    WiFi.begin(ssid);

    Serial.print("Connecting to WiFi");
    int attempt = 0;
    while (WiFi.status() != WL_CONNECTED) {
        delay(1000);
        Serial.print(".");
        attempt++;
        if (attempt > 20) {
            Serial.println("\nWiFi connection failed! Restarting...");
            ESP.restart();
        }
    }

    Serial.println("\nConnected to WiFi!");
    Serial.print("IP Address: ");
    Serial.println(WiFi.localIP());

    if (loginToWiFi()) {  // Login if necessary
        Serial.println("✅ Successfully logged in to captive portal!");
    } else {
        Serial.println("❌ Failed to log in!");
    }

    secureClient.setInsecure();  // Ignore SSL certificate
}

void loop() {
    if (WiFi.status() == WL_CONNECTED) {
        fetchAPI();
    } else {
        Serial.println("WiFi Disconnected!");
    }
    delay(5000);
}

// 📌 Function to log in to captive portal
bool loginToWiFi() {
    HTTPClient http;
    Serial.println("🔑 Logging into WiFi...");

    http.begin(client, loginURL);
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");

    String postData = "username=XXX&password=XXX&mode=191";  // Adjust if needed
    int httpCode = http.POST(postData);
    
    if (httpCode > 0) {
        String response = http.getString();
        Serial.printf("📡 Login Response (%d):\n%s\n", httpCode, response.c_str());
        
        if (response.indexOf("You are connected") != -1 || httpCode == 200) {
            http.end();
            return true;  // Login successful
        }
    } else {
        Serial.printf("❌ Login failed! HTTP Code: %d\n", httpCode);
    }

    http.end();
    return false;  // Login failed
}

// 📌 Function to fetch API data
void fetchAPI() {
    HTTPClient http;
    Serial.println("\n🌐 Fetching API data...");

    http.begin(secureClient, apiURL);
    int httpCode = http.GET();

    if (httpCode > 0) {
        Serial.printf("✅ API Response (%d):\n%s\n", httpCode, http.getString().c_str());
    } else {
        Serial.printf("❌ API Request Failed! HTTP Code: %d\n", httpCode);
    }

    http.end();
}