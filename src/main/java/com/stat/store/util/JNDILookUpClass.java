package com.stat.store.util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.Hashtable;

/**
 * Created by longnguyen on 2/3/15.
 */
public class JNDILookUpClass {
    private static Context initialContext;

    private static final String PKG_INTERFACES = "org.jboss.ejb.client.naming";

    /**
     *
     * @return
     * @throws javax.naming.NamingException
     */
    public static Context getInitialContext() throws NamingException {
        if (initialContext == null) {
            final Hashtable jndiProperties = new Hashtable();
            jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");

            initialContext = new InitialContext(jndiProperties);
        }
        return initialContext;
    }

    /**
     *
     * @return
     * @throws javax.naming.NamingException
     */
    public static Context getInitialContextClient() throws NamingException {
        if (initialContext == null) {
            final Hashtable jndiProperties = new Hashtable();
            jndiProperties.put("jboss.naming.client.ejb.context", true);
            jndiProperties.put(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.naming.remote.client.InitialContextFactory");
            jndiProperties.put(Context.PROVIDER_URL,  "remote://localhost:4447");
            jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
            jndiProperties.put(Context.SECURITY_PRINCIPAL, "testuser");
            jndiProperties.put(Context.SECURITY_CREDENTIALS, "testuser123");

            initialContext = new InitialContext(jndiProperties);
        }
        return initialContext;
    }

    /**
     *
     * @param className
     * @param beanClass
     * @return
     */
    public static String lookUpName(String className, String beanClass){
        String appName = "";

        String moduleName = "storestats";

        String distinctName = "";

        String beanName = beanClass;

        final String interfaceName = className;

        String name = "ejb:" + appName + "/" + moduleName + "/" + distinctName + "/" + beanName + "!" + interfaceName;

        return name;
    }
}
