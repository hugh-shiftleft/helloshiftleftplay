import com.google.inject.AbstractModule;

import java.util.stream.Collectors;
import java.util.Arrays;

import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;
import io.ebean.config.ServerConfig;
import io.ebean.EbeanServerFactory;
import org.avaje.datasource.DataSourceConfig;

public class StartModule extends AbstractModule {
  protected void configure() {
    // Workaround for a race-condition when initializing the default EbeanServer.
    Config config = ConfigFactory.load();
    ServerConfig ebeanConfig = new ServerConfig();

    DataSourceConfig db = new DataSourceConfig();
    db.setDriver(config.getString("db.default.driver"));
    db.setUsername(config.getString("db.default.username"));
    db.setPassword(config.getString("db.default.password"));
    db.setUrl(config.getString("db.default.url"));
    ebeanConfig.setDefaultServer(true);
    ebeanConfig.setDataSourceConfig(db);
    String[] packages = config.getString("ebean.default").split("\\.");
    String pkg = Arrays.stream(packages).filter(element -> !element.equals("*")).collect(Collectors.joining("."));

    ebeanConfig.addPackage(pkg);
    EbeanServerFactory.create(ebeanConfig);

    bind(ApplicationStart.class).asEagerSingleton();
  }
}
