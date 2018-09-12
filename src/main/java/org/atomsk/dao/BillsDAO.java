package org.atomsk.dao;


import org.atomsk.domain.BillsVO;

public class BillsDAO {

    public int getOrderNum(){
        final String sql ="select seq_order.nextval from dual";

        final StringBuilder result = new StringBuilder();

        new QueryExecutor() {
            @Override
            public void doJob() throws Exception {
                stmt = con.prepareStatement(sql);

                rs = stmt.executeQuery();
                while(rs.next()){
                    result.append(rs.getInt(1));
                }

            }
        }.executeAll();
        return Integer.parseInt(result.toString());
    }

    public void addBills(final BillsVO vo) {
        final String sql = "insert into tbl_bills (ono, mnum, mname, mprice, cnt)\n" +
                "values (seq_bills.nextval, ?, ?, ?, ?)";
        //mnum, score, cmt
        new QueryExecutor() {
            public void doJob() throws Exception {
                stmt = con.prepareStatement(sql);
                stmt.setInt(1, vo.getMnum());
                stmt.setInt(2, vo.getCnt());
                stmt.setInt(3, vo.getMprice());
                stmt.setString(4, vo.getMname());
                stmt.executeUpdate();
            }
        }.executeAll();
    }
}
