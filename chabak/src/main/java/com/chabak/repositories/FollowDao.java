package com.chabak.repositories;

import com.chabak.vo.Follow;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 프로필 수정(사진 수정 + 개인정보 창 링크 이동)

    // 게시글 갖고오기 + 뿌리기


    @Repository("FollowDao")
    public class FollowDao {
        @Autowired
        SqlSession sqlSession;

        public List<Follow> followingIdAndProfile(String id) throws Exception {

            return sqlSession.selectList("followingIdAndProfile", id);
        }

        public List<Follow> followerIdAndProfile(String id) throws Exception {
            return sqlSession.selectList("followerIdAndProfile", id);
        }

        public int deleteFollowingUser(String id, String followUserId)  throws Exception {
            Map<String , String> map = new HashMap<String, String>();
            map.put("id" , id);
            map.put("followUserId", followUserId);
            System.out.println("map test followDao:" + map);
            return sqlSession.delete("deleteFollowingUser", map);
        }

        public int deleteFollowerUser(String id, String followerUserId)  throws Exception {
            Map<String , String> map = new HashMap<String, String>();
            map.put("id" , id);
            map.put("followerUserId", followerUserId);
            System.out.println("map test followerDao:" + map);
            return sqlSession.delete("deleteFollowerUser", map);
        }

        public int followAddUser(String id, String selectedUserId)  throws Exception {
            Map<String , String> map = new HashMap<String, String>();
            map.put("id" , id);
            map.put("selectedUserId", selectedUserId);
            System.out.println("map test :" + map);
            return sqlSession.insert("followAddUser", map);
        }

        public int followDeleteUser(String id, String selectedUserId)  throws Exception {
            Map<String , String> map = new HashMap<String, String>();
            map.put("id" , id);
            map.put("selectedUserId", selectedUserId);
            System.out.println("map test :" + map);
            return sqlSession.insert("followDeleteUser", map);
        }

        public String decisionFollowStatus(String sessionId, String userId)  throws Exception {
            Map<String , String> map = new HashMap<String, String>();
            map.put("sessionId", sessionId);
            map.put("userId", userId);
            System.out.println("here decisionFollowStatus Dao :" + map);

            return sqlSession.selectOne("follow.decisionFollowStatus", map);
        }
}