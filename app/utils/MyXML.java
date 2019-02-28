package utils;

import akka.util.ByteString;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import play.api.http.HttpConfiguration;
import play.api.mvc.PlayBodyParsers;
import play.http.HttpErrorHandler;
import play.libs.XML;
import play.mvc.BodyParser;
import play.mvc.Http;

import javax.inject.Inject;
import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;

public class MyXML extends BodyParser.TolerantXml {
    private final HttpErrorHandler errorHandler;
    private final PlayBodyParsers parsers;

    public MyXML(long maxLength, HttpErrorHandler errorHandler, PlayBodyParsers parsers) {
        super(maxLength, errorHandler);
        this.errorHandler = errorHandler;
        this.parsers = parsers;
    }
    @Inject
    public MyXML(HttpConfiguration httpConfiguration, HttpErrorHandler errorHandler, PlayBodyParsers parsers) {
        super(httpConfiguration, errorHandler);
        this.errorHandler = errorHandler;
        this.parsers = parsers;
    }
    @Override
    protected Document parse(Http.RequestHeader request, ByteString bytes) throws Exception {
        //return XML.fromInputStream(bytes.iterator().asInputStream(), request.charset().orElse(null));
        try {

            String encoding = request.charset().orElse(null);
            InputSource is = new InputSource(bytes.iterator().asInputStream());
            if (encoding != null) {
                is.setEncoding(encoding);
            }
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            //factory.setFeature(XML.Constants.SAX_FEATURE_PREFIX + XML.Constants.EXTERNAL_GENERAL_ENTITIES_FEATURE, false);
            //factory.setFeature(XML.Constants.SAX_FEATURE_PREFIX + XML.Constants.EXTERNAL_PARAMETER_ENTITIES_FEATURE, false);
            //factory.setFeature(XML.Constants.XERCES_FEATURE_PREFIX + XML.Constants.DISALLOW_DOCTYPE_DECL_FEATURE, true);
            //factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
            //factory.setNamespaceAware(true);
            DocumentBuilder builder = factory.newDocumentBuilder();
            return builder.parse(is);
        } catch (ParserConfigurationException e) {
            throw new RuntimeException(e);
        } catch (SAXException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
