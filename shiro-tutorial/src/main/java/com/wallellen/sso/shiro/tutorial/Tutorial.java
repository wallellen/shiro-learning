package com.wallellen.sso.shiro.tutorial;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by walle on 3/3/16.
 */
public class Tutorial {
    private static final transient Logger log = LoggerFactory.getLogger(Tutorial.class);

    public static void main(String[] args) {
        log.info("My first Apache shiro application");
        //System.exit(-1);

        Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro.ini");

        SecurityManager securityManager = factory.getInstance();

        SecurityUtils.setSecurityManager(securityManager);

        Subject subject = SecurityUtils.getSubject();

        Session session = subject.getSession();
        session.setAttribute("someKey", "aValue");

        if (!subject.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken("lonestarr", "vespa");

            token.setRememberMe(true);

            try {
                subject.login(token);
                log.info("Login successful: " + subject.getPrincipal());
            } catch (Exception ex) {
                log.warn("Login failed: " + ex.getMessage());
            }
        }

        if (subject.hasRole("schwartz")) {
            log.info("May the schwartz be with you!");
        } else {
            log.info("Hello, more mortal");
        }

        if(subject.isPermitted("lightsaber:weild")) {
            log.info("You may use a lightsaber ring.Use it wisely");
        } else {
            log.info("Sorry, lightsaber rings are for schwartz master only");
        }

        //a (very powerful) Instance Level permission:
        if (subject.isPermitted("winnebago:drive:eagle5")) {
            log.info("You are permitted to 'drive' the winnebago with license plate (id) 'eagle5'.  " +
                    "Here are the keys - have fun!");
        } else {
            log.info("Sorry, you aren't allowed to drive the 'eagle5' winnebago!");
        }

        log.info("done");
    }
}
