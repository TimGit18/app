package de.domain.app.util.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

// Notwendig wegen JUnit 5
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import de.domain.app.util.Property;

public class PropertyTest {

    // Variablen für die Rechnner-Namen
    String EXPECTED_META_PC = "22H0566";
    String EXPECTED_PRIVAT_PC="DESKTOP-3NCAR95";
    String EXPECTED_SCHMI_PC="DESKTOP-Q6O0UGB";
    String EXPECTED_TEST_PC = "DESKTOP-LERLCJ6";

    // Variablen für die Logging-Pfade
    String EXPECTED_LOGPATH_META = "C:\\Users\\TSZ\\Daten\\Java\\Applications\\app\\logs";
    String EXPECTED_LOGPATH_PRIVAT = "C:\\Users\\Privat\\Daten\\Java\\Applications\\app\\logs";
    String EXPECTED_LOGPATH_SCHMI = "C:\\Users\\schmi\\Daten\\Java\\Applications\\app\\logs";
    String EXPECTED_LOGPATH_TEST = "C:\\Users\\test\\Daten\\Java\\Applications\\app\\logs";

    // Sonstige Variablen
    String EXPECTED_ERROR_HOST = "Kein Computername definiert";

    // Properties setzen und laden
    @BeforeAll
    public static void prepare() {
        Property.setProperties();
        Property.load();
    }

    // Test der PC-Namen
    @Test
    void testGetMetaPC() {
        assertEquals(EXPECTED_META_PC, Property.getMetaPC());
    }

    @Test
    void testGePrivatPC() {
        assertEquals(EXPECTED_PRIVAT_PC, Property.getPrivatPC());
    }

    @Test
    void testGetSchmiPC() { assertEquals(EXPECTED_SCHMI_PC, Property.getSchmiPC());
    }

    @Test
    void testGetTestPC() {
        assertEquals(EXPECTED_TEST_PC, Property.getTestPC());
    }

    // Test der Logging-Pfade
    @Test
    void testGetLogPathMeta() {
        assertEquals(EXPECTED_LOGPATH_META, Property.getLogPathMeta());
    }

    @Test
    void testGetLogPathP() {
        assertEquals(EXPECTED_LOGPATH_PRIVAT, Property.getLogPathPrivat());
    }

    @Test
    void testGetLogPathSchmi() {
        assertEquals(EXPECTED_LOGPATH_SCHMI, Property.getLogPathSchmi());
    }

    @Test
    void testGetLogPathTest() {
        assertEquals(EXPECTED_LOGPATH_TEST, Property.getLogPathTest());
    }

    // Test der Fehlermeldung
    @Test
    void testGetErrorHost() {
        assertEquals(EXPECTED_ERROR_HOST, Property.getErrorHost());
    }

}
