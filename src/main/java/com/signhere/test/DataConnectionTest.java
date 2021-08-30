package com.signhere.test;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DataConnectionTest {
	@Inject
	private DataSource ds;
	
	@Test
	public void testConnection() {
		try(Connection conn = ds.getConnection()) {
			System.out.println("DB Connection Success: " + conn);
		} catch(Exception e) {
			System.out.println("DB Connection fail");
			e.printStackTrace();
		}
	}
}
