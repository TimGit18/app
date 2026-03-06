package de.domain.app.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class Property {

    // Variablen für den Zugriff
    private static File file;
    private static Properties properties;

    // Variablen für die PC-Namen
    private static String metaPC;
    private static String privatPC;
    private static String schmiPC;
    private static String testPC;

    // Variablen für die Logging-Pfade
    private static String logPathMeta;
    private static String logPathPrivat;
    private static String logPathSchmi;
    private static String logPathTest;

    // Sonstige Variablen
    private static String errorHost;

    // Die Methode setProperties() setzt die Properties-Datei
    public static void setProperties() {
        // Statische Variablen für den Zugriff auf die Properties
        String directory = System.getProperty("user.dir") + File.separator + "properties";
        file = new File(directory, "app.properties");
        properties = new Properties();
        setKeys();
    }

    // Die Methode setKeys() setzt für jedes Property die Keys, um später einen Value auszuwerten
    private static void setKeys() {

        // Keys für die PC-Namen
        metaPC = "meta.pc";
        privatPC = "privat.pc";
        schmiPC = "schmi.pc";
        testPC = "test.pc";

        // Keys für die Logging-Pfade
        logPathMeta = "logpath.meta";
        logPathPrivat = "logpath.privat";
        logPathSchmi = "logpath.schmi";
        logPathTest = "logpath.test";

        // Sonstige Keys
        errorHost = "error.host";
    }

    // Die Methode load() erzeugt einen Eingabestrom mit Dateinamen und lädt die Properties des Projekts
    public static void load() {
        try {
            FileInputStream inputStream = new FileInputStream(file);
            properties.load(inputStream);
        } catch (FileNotFoundException fileNotFoundException) {
            System.err.println(file.toString() + " not found");
        }
        catch (IOException ignored) {
        }
    }

    // Getter für die PCs
    public static String getMetaPC() {
        System.out.println("Meta PC: " + properties.getProperty("meta.pc"));
        return properties.getProperty(metaPC);
    }

    public static String getPrivatPC() {
        return properties.getProperty(privatPC);
    }

    public static String getTestPC() {
        return properties.getProperty(testPC);
    }

    public static String getSchmiPC() {
        return properties.getProperty(schmiPC);
    }

    // Getter für Log-Pfade
    public static String getLogPathMeta() {
        return properties.getProperty(logPathMeta);
    }

    public static String getLogPathPrivat() { return properties.getProperty(logPathPrivat); }

    public static String getLogPathSchmi() { return properties.getProperty(logPathSchmi); }

    public static String getLogPathTest() {
        return properties.getProperty(logPathTest);
    }

    public static String getErrorHost() {
        return properties.getProperty(errorHost);
    }


}
