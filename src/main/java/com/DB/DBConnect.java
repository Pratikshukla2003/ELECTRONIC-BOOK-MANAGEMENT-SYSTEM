package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;

	public static Connection getConn() {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://mysql-155831d0-pratikshukla9926-ab7f.h.aivencloud.com:21383/defaultdb", "avnadmin", "AVNS_1ol5H3RNQEMD2ICbBn8");

		} catch (Exception e) {

			e.printStackTrace();

		}
		return conn;
	}
}
