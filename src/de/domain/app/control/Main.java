package de.domain.app.control;

import de.domain.app.util.Property;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.net.InetAddress;

public class Main {

    private static String META_PC = null;
    private static String PRIVAT_PC = null;
    private static String SCHMI_PC = null;
    private static String TEST_PC = null;

    private static String LOG_PATH_META_PC = null;
    private static String LOG_PATH_PRIVAT_PC = null;
    private static String LOG_PATH_SCHMI_PC = null;
    private static String LOG_PATH_TEST_PC = null;
    private static String ERROR_HOST = null;

    public static void main(String[] args) {
        // System.out.println("Hello World!");
        // Initialisierung
        initialize();

        // Setzen der System-Properties
        String computerName = getHostName();
        String logPath = setLogPath(computerName);

        // Parameter, um den Workflow zu steuern
        Logger LOG = LogManager.getLogger(Main.class.getName());
        if (LOG.isTraceEnabled()) {
            LOG.trace("LogPath: " + logPath);
        }
        System.out.println(logPath);
        System.out.println(computerName);
    }

    //  Die Methode initialize() setzt die Propiertes und lädt sie
    public static void initialize() {
        // Application Properties setzen und laden
        Property.setProperties();
        Property.load();

        // Computernamen ermitteln
        META_PC = Property.getMetaPC();
        PRIVAT_PC = Property.getPrivatPC();
        SCHMI_PC = Property.getSchmiPC();
        TEST_PC = Property.getTestPC();

        // Logging-Pfade ermitteln
        LOG_PATH_META_PC = Property.getLogPathMeta();
        LOG_PATH_PRIVAT_PC = Property.getLogPathPrivat();
        LOG_PATH_SCHMI_PC = Property.getLogPathSchmi();
        LOG_PATH_TEST_PC = Property.getLogPathTest();

        // Error Message ermitteln
        ERROR_HOST = Property.getErrorHost();
    }

    // Die Methode getHostName() ermittelt den Rechnernamen
    public static String getHostName() {
        String hostName = "";
        // Den Rechnernamen aus der Umgebung holen
        try {
            hostName = InetAddress.getLocalHost().getHostName();
        } catch (IOException ioException) {
            System.err.println(ioException.getMessage());
        }
        return hostName;
    }

    // Die Methode setLogPath() setzt den Logging Path abhänging vom Rechnernamen
    public static String setLogPath(String computerName) {
        String logPath = "";

        // Abfrage des Rechnernamens und setzen des Logging Pfads
        if (META_PC.equals(computerName)) {
            logPath = LOG_PATH_META_PC;
        } else if (PRIVAT_PC.equals(computerName)) {
            logPath = LOG_PATH_PRIVAT_PC;
        } else if (SCHMI_PC.equals(computerName)) {
            logPath = LOG_PATH_SCHMI_PC;
        } else if (TEST_PC.equals(computerName)) {
            logPath = LOG_PATH_TEST_PC;
        } else {
            System.err.println(ERROR_HOST);
        }

        // Setzen des System Logging-Pfades
        System.setProperty("log.path", logPath);
        return logPath;
    }
}


