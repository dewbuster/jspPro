package days04.board.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import days04.board.domain.BoardDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDAOImpl implements BoardDAO{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 생성자 DI
	public BoardDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public ArrayList<BoardDTO> select() throws SQLException {
		long seq;
		String title, writer, email;
		Date writedate;
		int readed;

		ArrayList<BoardDTO> list = null;

		String sql = "SELECT seq, title, writer, email, writedate, readed "
				+ "FROM tbl_cstVSBoard "
				+ "ORDER BY seq DESC";

		//부서조회
		BoardDTO dto = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					seq = rs.getLong("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");
					dto = new BoardDTO().builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.email(email)
							.writedate(writedate)
							.readed(readed)
							.build();
					list.add(dto);
				} while (rs.next());
			} // if
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@Override
	   public int insert(BoardDTO dto) throws SQLException {
	      // writedate  default  sysdate
	      // readed     default  0
	      int rowCount = 0;
	      String sql = "INSERT INTO tbl_cstvsboard "
	               + " (seq, writer, pwd, email, title, tag, content ) "
	               + "VALUES "
	               + " (seq_tblcstvsboard.NEXTVAL, ?, ?, ?, ?, ?, ? ) ";
	      
	      this.pstmt = conn.prepareStatement(sql);      
	         pstmt.setString(1,  dto.getWriter() );
	         pstmt.setString(2,  dto.getPwd() );
	         pstmt.setString(3,  dto.getEmail() );
	         pstmt.setString(4,  dto.getTitle() );
	         pstmt.setInt(5, dto.getTag());
	         pstmt.setString(6,  dto.getContent() );
	      rowCount = this.pstmt.executeUpdate();
	      this.pstmt.close();
	      
	      return rowCount;
	   }

}
