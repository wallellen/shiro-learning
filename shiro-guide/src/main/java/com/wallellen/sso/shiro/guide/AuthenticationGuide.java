package com.wallellen.sso.shiro.guide;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

/**
 * Created by walle on 3/3/16.
 */
public class AuthenticationGuide {
    public static void main(String[] args) {

    }

    private void step1(String userName, String password) {
        UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
        token.setRememberMe(Boolean.TRUE);

        Subject subject = SecurityUtils.getSubject();

        try {
            subject.login(token);
        } catch (UnknownAccountException ex) {

        } catch (IncorrectCredentialsException ex) {

        } catch (LockedAccountException ex) {

        } catch (ExcessiveAttemptsException ex) {

        }

        //TODO

        subject.logout();
    }
}
