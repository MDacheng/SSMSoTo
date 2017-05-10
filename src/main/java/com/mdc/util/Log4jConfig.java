package com.mdc.util;

import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mengdacheng on 2017/5/10.
 */
public class Log4jConfig {
    private boolean reload = true;
    private int interval = 60000;
    private static final Logger logger = LoggerFactory.getLogger(Log4jConfig.class);

    public Log4jConfig(boolean reload, int interval) {
        this.reload = reload;
        this.interval = interval;
        this.loadConfig();
    }

    public void loadConfig() {
        String log4jPath = Log4jConfig.class.getClassLoader().getResource("log4j.properties").getPath();
        // 间隔特定时间，检测文件是否修改，自动重新读取配置
        PropertyConfigurator.configureAndWatch(log4jPath, this.interval);
    }
}
