package com.beans.dbcp;

//@author  Anil Hemrajani
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Vector;

public class DBConnectionMgr {
    private Vector connections = new Vector(10);
    //Vector 클랙스는 객체를 여러 개 저장할 때 사용하는 객체이다.
    //커넥션 객체 10개를 저장할 공간을 할당한다.(만든다.)
    private String _driver = "com.mysql.jdbc.Driver";
    private String _url = "jdbc:mysql://127.0.0.1:3306/beansdb?useUnicode=true&characterEncoding=EUC_KR";
    private String _user = "dba";
    private String _password = "dbapwd";
    private boolean _traceOn = false;
    private boolean initialized = false;
    private int _openConnections = 10;
    private static DBConnectionMgr instance = null;

    public DBConnectionMgr( ) { }
    //메서드를 정의할 때 static 키워드를 사용하면 클래스명으로 메서드에 바로 참조할 수 있다.
    //메서드를 호출할 때 레퍼런스 변수가 반드시 필요한데, 스태틱 메서드는 클래스명으로 바로 참조하므로
    //레퍼런스 변수가 필요없다. 따라서 객체 생성 코드도 필요없다.
    public static DBConnectionMgr getInstance( ) { //커넥션 풀 객체를 얻는다.
        if (instance == null) {
            synchronized (DBConnectionMgr.class) {
                if (instance == null) {
                    instance = new DBConnectionMgr( );
                    //DBConnectionMgr 객체를 생성한다.
                }
            }
        }
        return instance; //DBConnectionMgr 객체를 반환한다.
    }

    public void setOpenConnectionCount(int count) {
        _openConnections = count;
    }


    public void setEnableTrace(boolean enable) {
        _traceOn = enable;
    }

    public Vector getConnectionList( ) { 
    	return connections;
    }
 
    public synchronized void setInitOpenConnections(int count) throws SQLException {
        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < count; i++) {
            c = createConnection();
            co = new ConnectionObject(c, false);

            connections.addElement(co);
            trace("ConnectionPoolManager: Adding new DB connection to pool (" + connections.size() + ")");
        }
    }
 
    public int getConnectionCount( ) {
        return connections.size();
    }

    public synchronized Connection getConnection( ) throws Exception {
    	//커넥션 풀에서 커넥션 객체(Connection)를 얻어온다.
        if (!initialized) {
            Class c = Class.forName(_driver); //JDBC 드라이버 로드하여 DriverManager에 등록한다.
            DriverManager.registerDriver((Driver) c.newInstance( ));

            initialized = true;
        }

        Connection c = null;
        ConnectionObject co = null;
        boolean badConnection = false;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            
            if (!co.inUse) {
                try {
                    badConnection = co.connection.isClosed( );
                    if (!badConnection)
                        badConnection = (co.connection.getWarnings( ) != null);
                }catch (Exception e) {
                    badConnection = true;
                    e.printStackTrace();
                }

                // Connection is bad, remove from pool
                if (badConnection) {
                    connections.removeElementAt(i);
                    trace("ConnectionPoolManager: Remove disconnected DB connection #" + i);
                    continue;
                }

                c = co.connection;
                co.inUse = true;

                trace("ConnectionPoolManager: Using existing DB connection #" + (i + 1));
                break;
            }
        }

        if (c == null) {
            c = createConnection( );
            co = new ConnectionObject(c, true);
            connections.addElement(co);

            trace("ConnectionPoolManager: Creating new DB connection #" + connections.size());
        }

        return c; //Connection 객체 10개 중에 사용 가능한 Connection 객체를 반환한다.
    }

    public synchronized void freeConnection(Connection c) {
        if (c == null)
            return;

        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (c == co.connection) {
                co.inUse = false;
                break;
            }
        }

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if ((i + 1) > _openConnections && !co.inUse)
                removeConnection(co.connection);
        }
    }

    public void freeConnection(Connection c, PreparedStatement p, ResultSet r) {
        try {
            if (r != null) r.close( );
            if (p != null) p.close( );
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace( );
        }
    }

    public void freeConnection(Connection c, Statement s, ResultSet r) {
        try {
            if (r != null) r.close();
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace( );
        }
    }

    public void freeConnection(Connection c, PreparedStatement p) {
        try {
            if (p != null) p.close( );
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, Statement s) {
        try {
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public synchronized void removeConnection(Connection c) {
        if (c == null)
            return;

        ConnectionObject co = null;
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if(c == co.connection) {
                try{
                    c.close( );
                    connections.removeElementAt(i);
                    trace("Removed " + c.toString( ));
                }catch (Exception e) {
                    e.printStackTrace( );
                }

                break;
            }
        }
    }

    private Connection createConnection( ) throws SQLException {
        Connection con = null;

        try {
            if(_user == null)
                _user = "";
            if(_password == null)
                _password = "";

            Properties props = new Properties( );
            props.put("user", _user);
            props.put("password", _password);

            con = DriverManager.getConnection(_url, props);
        } catch (Throwable t) {
            throw new SQLException(t.getMessage( ));
        }

        return con;
    }

    public void releaseFreeConnections( ) {
        trace("ConnectionPoolManager.releaseFreeConnections( )");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (!co.inUse)
                removeConnection(co.connection);
        }
    }

    public void finalize( ) {
        trace("ConnectionPoolManager.finalize( )");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size( ); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            try {
                co.connection.close( );
            } catch (Exception e) {
                e.printStackTrace( );
            }

            co = null;
        }

        connections.removeAllElements( );
    }

    private void trace(String s) {
        if (_traceOn)
            System.err.println(s);
    }
}

class ConnectionObject {
    public java.sql.Connection connection = null;
    public boolean inUse = false;

    public ConnectionObject(Connection c, boolean useFlag) {
        connection = c;
        inUse = useFlag;
    }
}