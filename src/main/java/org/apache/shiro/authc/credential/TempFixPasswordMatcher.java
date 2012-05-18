package org.apache.shiro.authc.credential;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.credential.PasswordMatcher;

/**
 * Applies a temporary fix to the PasswordMatcher since it does not take character arrays into account.
 */
public class TempFixPasswordMatcher extends PasswordMatcher {

    @Override
    protected Object getStoredPassword(AuthenticationInfo storedAccountInfo) {
        Object stored = super.getStoredPassword(storedAccountInfo);
        if (stored instanceof char[]) {
            return new String((char[])stored);
        }
        return stored;
    }
}
