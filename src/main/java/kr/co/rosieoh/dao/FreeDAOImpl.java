package kr.co.rosieoh.dao;

import kr.co.rosieoh.dto.Free;
import kr.co.rosieoh.dto.FreeComment;
import kr.co.rosieoh.dto.Reco;
import kr.co.rosieoh.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FreeDAOImpl implements FreeDAO {
        @Autowired
        private SqlSession sqlSession;

        @Override
        public List<Free> freeList(Page page) throws Exception {
            return sqlSession.selectList("free.freeList", page);
        }

        @Transactional
        @Override
        public Free freeDetail(int fno) throws Exception {
            sqlSession.update("free.hitsUp", fno);
            return sqlSession.selectOne("free.freeDetail", fno);
        }

        @Override
        public void hitsDown(int fno) throws Exception {
            sqlSession.update("free.hitsDown", fno);
        }

        @Override
        public void freeInsert(Free dto) throws Exception {
            sqlSession.insert("free.freeInsert", dto);
        }

        @Override
        public void freeDelete(int fno) throws Exception {
            sqlSession.delete("free.freeDelete", fno);
        }

        @Override
        public void freeEdit(Free dto) throws Exception {
            sqlSession.update("free.freeEdit", dto);
        }

        @Override
        public int totalCount(Page page) throws Exception {
            return sqlSession.selectOne("free.totalCount", page);
        }

        @Override
        public List<Free> freeBestRecList() throws Exception {
            return sqlSession.selectList("free.freeBestRecList");
        }

        @Override
        public List<Free> freeBestCmtList() throws Exception {
            return sqlSession.selectList("free.freeBestCmtList");
        }

        @Override
        public List<FreeComment> freeCommentList(int fno) throws Exception {
            return sqlSession.selectList("free.freeCommentList", fno);
        }

        @Override
        public void commentInsert(FreeComment dto) throws Exception {
            sqlSession.insert("free.commentInsert", dto);
        }

        @Override
        public void commentDelete(int cno) throws Exception {
            sqlSession.delete("free.commentDelete", cno);
        }

        @Override
        public List<Free> commentCount() throws Exception {
            return sqlSession.selectList("free.commentCount");
        }

        @Override
        public Reco findReco(int fno, String id) throws Exception {
            Map<String, Object> map = new HashMap<>();
            map.put("fno", fno);
            map.put("id", id);
            return sqlSession.selectOne("free.findReco",map);
        }

        @Override
        public Reco memberFindReco(Reco reco) throws Exception {
            return sqlSession.selectOne("free.memberFindReco", reco);
        }

        @Override
        public int insertReco(Reco reco) throws Exception {
            return sqlSession.insert("free.insertReco", reco);
        }

        @Override
        public int deleteReco(Reco reco) throws Exception {
            return sqlSession.delete("free.deleteReco", reco);
        }

        @Override
        public void increaseRec(Reco reco) throws Exception {
            sqlSession.update("free.increaseRec", reco);
        }

        @Override
        public void decreaseRec(Reco reco) throws Exception {
            sqlSession.update("free.decreaseRec", reco);
        }


    }