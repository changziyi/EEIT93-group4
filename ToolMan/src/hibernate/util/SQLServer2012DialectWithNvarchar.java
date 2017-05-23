package hibernate.util;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.SQLServerDialect;
//import org.hibernate.type.StandardBasicTypes;

public class SQLServer2012DialectWithNvarchar extends SQLServerDialect{
	public SQLServer2012DialectWithNvarchar () {
		super();
		registerHibernateType(Types.NCHAR, Hibernate.CHARACTER.getName()); 
        registerHibernateType(Types.NCHAR, 1, Hibernate.CHARACTER.getName());
        registerHibernateType(Types.NCHAR, 255, Hibernate.STRING.getName());
        registerHibernateType(Types.NVARCHAR, Hibernate.STRING.getName());
        registerHibernateType(Types.LONGNVARCHAR, Hibernate.TEXT.getName());
        registerHibernateType(Types.NCLOB, Hibernate.CLOB.getName());
    }
}
