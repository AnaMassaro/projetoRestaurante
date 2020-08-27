package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDAO {
	
	private Connection con;
	private PreparedStatement ps;
	private User u;
	
	public boolean login(String user, String senha) throws SQLException{
		String sql = "select user,senha from administrador WHERE user = '" + user + "' AND senha = '" + senha + "';";
		
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			if(rs.getString("user").equals(user) && (rs.getString("senha").equals(senha))) {
				return true;
			}
		}
		return false;
	}
	
	public boolean cadastraUsuario(User u) throws SQLException {
		String sql = "insert into administrador values(default, ?, ?);";
		con = ConnectionDB.getConnection();
		
		ps = con.prepareStatement(sql);
		ps.setString(1, u.getUser());
		ps.setString(2, u.getSenha());

		if(ps.executeUpdate()>0){
			return true;
		}else {
			return false;
		}
	}

	public List<User> listaUsuarios() throws SQLException {
		List<User> lu;
		String sql = "select * from administrador";
		con = ConnectionDB.getConnection();
		PreparedStatement prep = con.prepareStatement(sql);
		ResultSet rs = prep.executeQuery();
		lu = new ArrayList<User>();
		
		while(rs.next()) {
			u = new User();
			u.setCodigoUser(rs.getInt("codigoUser"));
			u.setUser(rs.getString("user"));
			u.setSenha(rs.getString("senha"));
			lu.add(u);
		}
		return lu;
	}
	
	public User getUser(int capturei) throws SQLException {
		User u = new User();
		String sql = "select * from administrador where codigoUser = ?";
		con = ConnectionDB.getConnection();
		PreparedStatement prepa = con.prepareStatement(sql);
		prepa.setInt(1, capturei);
		ResultSet res = prepa.executeQuery();
		while(res.next()) {
			u.setCodigoUser(res.getInt("codigoUser"));
			u.setUser(res.getString("user"));
			u.setSenha(res.getString("senha"));
		}
		return u;
	}

	
	public boolean userExiste(int cod) throws SQLException {
		String sql = "select * from administrador where codigoUser = ?;";
		con = ConnectionDB.getConnection();
		ps = con.prepareStatement(sql);
		ps.setInt(1, cod);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			if(rs.getInt(1) == cod) {
				return true;
			}
		}
		return false;
	}
	
	public boolean editar(User u, int cod) {
		boolean editado = false;
		
		try {
			if(userExiste(cod)) {
				String sql = "update administrador set user = ?, senha = ? where codigoUser = " + cod + ";";
				con = ConnectionDB.getConnection();
				PreparedStatement prs = con.prepareStatement(sql);
				
				prs.setString(1, u.getUser());
				prs.setString(2, u.getSenha());
				
				prs.execute();
				editado = true;	
				
			}
		} catch (SQLException e) {
			System.out.print("erro" + e);
		
		}
		return editado;
	}
	

	public void excluir(int cod) {
		String sql = "delete from administrador where codigoUser = ?";
		con = ConnectionDB.getConnection();
		try(PreparedStatement preparedStatement = con.prepareStatement(sql)){
			preparedStatement.setInt(1, cod);
			preparedStatement.execute();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}
